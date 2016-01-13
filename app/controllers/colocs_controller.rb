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
                @total_coloc_count = Coloc.last.id
                @roommates = @coloc.users.order(:created_at)
                user_number = @roommates.count
                
                @expenses = @coloc.get_expenses
				@auto_expenses = @expenses.select{|item| item.auto == 1}
				@expenses = @expenses.keep_if{|item| item.auto == 0}
                
                flash[:info] = t("main.noexpenseadded") if @expenses.count == 0
				
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
							flash[:success] = t("main.createcolocwithoutemail")
						end
                        redirect_to create_users_path(:user => @user, :secret => @secret)
                    else
                        flash[:error] = t("main.unabletocreateflatshare")
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
					_expense.auto = 1 if params[:auto]
									
					if _expense.save
						_coloc.ca += _expense.montant
						_coloc.save
					    begin
							DepenseMailer.new_expense_email(_expense).deliver
						rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, NoMethodError => e
							flash[:success] = t("main.expensesuccessnoemail")							
						else
							flash[:success] = t("main.expensesuccess")
						end
					else	
                        flash[:error] = t("main.expensefailure")
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
					flash[:success] = t("main.flatsharedeletionsuccess")
					redirect_to root_path
				else
					flash[:error] = t("main.flatsharedeletionfailure")
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
                        flash[:success] = t("main.flatshareupdatesuccess")
                else
                        redirect_to @coloc
                        flash[:error] = t("main.flatshareupdatefailure")
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
				rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, NoMethodError => e
					flash[:warning] = t("main.shareexpensedistributionfailure")							
				else
					flash[:success] = t("main.shareexpensedistributionsuccess")
				end
			else
				render :status => 404
			end
		end
		
		private
		
	        def missing_flatshare
                flash[:error] = t("main.missingflatshareerror")
                redirect_to Coloc.find(current_user.coloc_id) 		        
	        end
	        
	        def redirect_if_wrong_flatshare(coloc)
                  if coloc.id != current_user.coloc_id
                    flash[:warning] = t("main.unabletoseeflatsharedata")
                    redirect_to(Coloc.find(current_user.coloc_id))
                  end   	        
	        end
end            
