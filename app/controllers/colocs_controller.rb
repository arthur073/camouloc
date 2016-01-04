# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
        helper_method :sort_column, :sort_direction
        layout "dashboard"
        before_filter :require_login, :only => [:show, :destroy, :update, :missing_flatshare]
        rescue_from ActiveRecord::RecordNotFound, :with => :missing_flatshare    

        def show              
                @coloc = Coloc.find(params[:id])
                
                # Avoiding confidential data leak      
                redirect_if_wrong_flatshare(@coloc)
                
                                
                @coloc_ranking = Coloc.order(:ca).index(@coloc)
                @total_coloc_count = Coloc.all.count
                @roommates = @coloc.users.order(:created_at)
                user_number = @roommates.count
                
                @expenses = []
                if user_number <= 2
                    @expenses = Depense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id]}, :order => "created_at ASC")
                elsif user_number == 3
                    @expenses = TroisDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id]}, :order => "created_at ASC")
                elsif user_number == 4
                    @expenses = QuatreDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id, @roommates[3].id]}, :order => "created_at ASC")
                elsif user_number > 4
                    @expenses = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", @roommates.map { |c| c.id }])
                    @expenses.delete_if {|item| item == [] or item.auto == 1 } 
                end
                
                flash[:info] = "Hey! It looks like you haven't entered any expense yet. You can do so from the expense screen." if @expenses.count == 0
				
				@arrayTot = @coloc.get_tot
				@arrayReimbursement = @coloc.get_reimbursement(@arrayTot)
				@expensesMatrix = @coloc.get_expenses_matrix
				@namesMatrix = @coloc.get_names_matrix
				@colorsMatrix = @roommates.map{|r| r.color[1] }
				@params_chord = @coloc.get_chord_params(@expensesMatrix)
				@params_lineChart = @coloc.get_lineChart_params(@expenses)				
        end

        def create
                @coloc = Coloc.new
                @coloc.nom = params[:nom]
                @coloc.palm = 1              
                @coloc.ca = 0
                @secret = SecureRandom.hex(50)
                @coloc.secret = @secret

                if @coloc.save
					if params[:user][:user_id].present?
						# user is logged via provider
						@user = User.find(params[:user][:user_id]) 
						@user.password = params[:user][:password]
					else 
						# user is logged via classic form
						@user = User.new(params[:user])	
						@user.email = params[:email]
					end
					
                    @user.coloc_id = @coloc.id
                    @user.tot = 0 
                    @user.set_image
                    
                    if @user.save
                        sign_in @user unless signed_in?
					    begin
                        UserMailer.colocemail(@coloc).deliver
                        UserMailer.progress_email(@user).deliver
						rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
							flash[:success] = "Your account has been created, but we are currently unable to send you a confirmation email"
						end
                        redirect_to create_users_path(:user => @user, :secret => @secret)
                    else
                        flash[:error] = "Error!"
                        render 'sessions#new'
                    end                   
                end
        end
        
        def redirect_to_expense_screen
            _roommates_count = Coloc.find(current_user.coloc_id).users.count
            if _roommates_count <= 2
                redirect_to new_depense_path
            elsif _roommates_count == 3
                redirect_to new_trois_depense_path
            elsif _roommates_count == 4
                redirect_to new_quatre_depense_path
            elsif _roommates_count > 4
                redirect_to new_expense_path
            end
        end

        def save_expense
			if params[:user_id] && params[:montant] && params[:raison] && params[:coloc_id] && params[:coloc_secret] && params[:roommates_involved]		
				_author = params[:user_id]
				_amount = params[:montant].gsub("/[ €$]/g","").gsub(",",".").to_f
				_reason = params[:raison].gsub("_"," ").capitalize							
				_coloc = Coloc.find(params[:coloc_id])	
				_colocataires = _coloc.users.all
				_colocataires_id = _colocataires.map{|c| c.id}
				_coloc_secret_received = params[:coloc_secret]
				_roommates_involved = params[:roommates_involved]
				
				if _coloc.secret.eql? _coloc_secret_received				
					if _colocataires.count <= 2
						_expense = Depense.new
						_expense.destinataire_part = 0
						_expense.destinataire_part2 = 0
						_roommates_involved.each_with_index do |r,i|
							_expense.destinataire_part = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[0].to_i
							_expense.destinataire_part2 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[1].to_i
						end
					elsif _colocataires.count == 3
						_expense = TroisDepense.new
						_expense.destinataire_part = 0
						_expense.destinataire_part2 = 0
						_expense.destinataire_part3 = 0						
						_roommates_involved.each_with_index do |r,i|
							_expense.destinataire_part = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[0].to_i
							_expense.destinataire_part2 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[1].to_i
							_expense.destinataire_part3 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[2].to_i
						end
					elsif _colocataires.count == 4
						_expense = QuatreDepense.new
						_expense.destinataire_part = 0
						_expense.destinataire_part2 = 0
						_expense.destinataire_part3 = 0						
						_expense.destinataire_part4 = 0						
						_roommates_involved.each_with_index do |r,i|
							_expense.destinataire_part = 1  if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[0].to_i
							_expense.destinataire_part2 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[1].to_i
							_expense.destinataire_part3 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[2].to_i
							_expense.destinataire_part4 = 1 if _colocataires_id.index(r.to_i) >= -1 && r.to_i == _colocataires_id[3].to_i
						end
					elsif _colocataires.count > 4
						_expense = Expense.new
						_parties = {}
						_colocataires.each do |c| 
							_parties[c.id] = 0
						end
						_roommates_involved.each_with_index do |r,i|
							_parties[r.to_i] = 1
						end
						_expense.parties = _parties
					end

					# Shared params
					_expense.raison = _reason
					_expense.montant = _amount
					_expense.user_id = _author
					_expense.nbr_users = _roommates_involved.count
									
					if _expense.save
						_coloc.ca += _expense.montant
						_coloc.save
					    begin
							DepenseMailer.new_expense_email(_expense).deliver
						rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, NoMethodError => e
							flash[:success] = "Expense successfully saved! Email has not been sent however."							
						else
							flash[:success] = "Expense successfully saved!"
						end
					else	
                        flash[:error] = "Error creating your expense. Please verify your inputs."
					end
					redirect_to :back
				else	
					render :text => "Unauthorized"
				end
			end
        end


        def destroy
				if params[:coloc][:id] && params[:coloc][:nom]
					_coloc = Coloc.find(params[:coloc][:id])
					_coloc.destroy
					flash[:success] = "Flatshare successfully removed. See you soon on Camouloc"
					redirect_to root_path
				else
					flash[:error] = "Error: you are not authorized to delete this flatshare"
					redirect_to root_path
				end
        end

        def edit
        end

        def update
                @coloc = Coloc.find(params[:id])
                @coloc.nom = params[:nom]
                
                if @coloc.save
                        redirect_to @coloc
                        flash[:success] = "Flatshare settings updated"
                else
                        redirect_to @coloc
                        flash[:error] = "Error updating your flatshare settings. Please try again."
                end
        end
	
		def verify_coloc
			render :status => 409 unless Coloc.where('lower(nom) = ?', params[:nom].downcase).first.nil? || (params[:prev_name] && params[:prev_name] == params[:nom])
		end
		
		def reset_counters
			if !params[:coloc_id].blank?
				_coloc = Coloc.find(params[:coloc_id])
				begin
					UserMailer.reset_counters_email(_coloc).deliver
				rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
					flash[:warning] = "Unable to reach all your roommmates. Please check there email addresses for typing errors"							
				else
					flash[:success] = "Expenses distribution successfully shared with your roommates"
				end
			else
				render :status => 404
			end
		end
		
		private
		
	        def missing_flatshare
                flash[:error] = "Error: unable to find this flatshare"
                redirect_to Coloc.find(current_user.coloc_id) 		        
	        end
	        
	        def redirect_if_wrong_flatshare(coloc)
                  if coloc.id != current_user.coloc_id
                    flash[:warning] = "Oops! You are not able to see this flatshare's data"
                    redirect_to(Coloc.find(current_user.coloc_id))
                  end   	        
	        end
end            
