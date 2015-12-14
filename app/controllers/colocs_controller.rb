# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
        #rescue_from ActiveRecord::RecordNotFound, :with => :coloc_manquante
        helper_method :sort_column, :sort_direction
        layout "dashboard"

        def show
                @coloc = Coloc.find(params[:id])
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
				@params_chord = @coloc.get_chord_params(@expensesMatrix)
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
                        UserMailer.colocemail(@coloc).deliver
                        UserMailer.progress_email(@user).deliver
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
						rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
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

        def tabbord 
                @coloc = Coloc.find(params[:id])
                @nbrcoloc = @coloc.users.size
                @colocataires = @coloc.users.order(:created_at)
                @titre = "Tableau de bord" unless mobile_device?
                @titre = "Résumé" if mobile_device?

		# affichage de toutes les dépenses de la colocation
      @expenses = Array.new 
		if @nbrcoloc == 2 
			@dep = Depense.all(:conditions => {:user_id => [@colocataires[0].id, @colocataires[1].id]}, :order => "created_at ASC")
		elsif @nbrcoloc == 3
			@dep = TroisDepense.all(:conditions => {:user_id => [@colocataires[0].id, @colocataires[1].id, @colocataires[2].id]}, :order => "created_at ASC")
		elsif @nbrcoloc == 4 
			@dep = QuatreDepense.all(:conditions => {:user_id => [@colocataires[0].id, @colocataires[1].id, @colocataires[2].id, @colocataires[3].id]}, :order => "created_at ASC")
      elsif @nbrcoloc > 4
         @dep = Array.new 
         @expenses = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", @colocataires.map { |c| c.id }] )
         @expenses.delete_if {|item| item == [] or item.auto == 1 } 

         @expensesSource = Array.new
         @colocataires.each do |coloc, i|
            @tmp = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", coloc.id ])
            if @tmp == [] 
               @expensesSource.push(0)
            else
               @sum = 0
               @tmp.each do |t|
                 @sum += t.montant
               end 
               @expensesSource.push(@sum)
            end
         end
         @expensesSource.reverse!
		end

                if (signed_in? and current_user.coloc_id != @coloc.id and not current_user.admin?)
                        # si l'utilisateur n'est pas dans la coloc  et qu'il n'est pas admin, il est redirigé
                        flash[:error] = t('flash.tabbord') 
                        redirect_to Coloc.find(current_user.coloc_id)
                end

                if @coloc.users.count < 2
                        # si la coloc n'a qu'un user, son tableau de bord n'existe pas
                        flash[:error] = "Error, this flatshare doesn't have enough roommates." 
                        redirect_to @coloc.users[0]
                end

                # calcul des dettes :
                if @nbrcoloc == 2
                        #pour le coloc 1 :
                        @sesdep1 = @colocataires[0].depenses.where(:nbr_users => 1, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep2inv = @dep2inv + colocataires2.depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.depenses.where(:nbr_users => 1, :destinataire_part => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2  - @dep1inv - @dep2inv/2 

                        #pour le coloc 2 :
                        @sesdep1 = @colocataires[1].depenses.where(:nbr_users => 1, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep2inv = @dep2inv + colocataires2.depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.depenses.where(:nbr_users => 1, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2  - @dep1inv - @dep2inv/2 
                        @sumdep1 = @colocataires[0].depenses.where(:auto => 0).sum(:montant)
                        @sumdep2 = @colocataires[1].depenses.where(:auto => 0).sum(:montant)

                elsif @nbrcoloc == 3
                        #pour le coloc 1 :
                        #@mesdep1 = @colocataires[0].trois_depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                        @sesdep1 = @colocataires[0].trois_depenses.where(:nbr_users => 1, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].trois_depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[0].trois_depenses.where(:nbr_users => 2, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[0].trois_depenses.where(:nbr_users => 3, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3  - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        #pour le coloc 2 :
                        @mesdep1 = @colocataires[1].trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[1].trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[1].trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[1].trois_depenses.where(:nbr_users => 3, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        #pour le coloc 3 :
                        @mesdep1 = @colocataires[2].trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[2].trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[2].trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[2].trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[2].trois_depenses.where(:nbr_users => 3, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[2].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[2].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        @sumdep1 = @colocataires[0].trois_depenses.where(:auto => 0).sum(:montant)
                        @sumdep2 = @colocataires[1].trois_depenses.where(:auto => 0).sum(:montant)
                        @sumdep3 = @colocataires[2].trois_depenses.where(:auto => 0).sum(:montant)


                elsif @nbrcoloc == 4
                        #pour le coloc 1 :
                        @mesdep1 = @colocataires[0].quatre_depenses.where(:nbr_users => 1, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[0].quatre_depenses.where(:nbr_users => 1, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].quatre_depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[0].quatre_depenses.where(:nbr_users => 2, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[0].quatre_depenses.where(:nbr_users => 3, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @sesdep3 = @colocataires[0].quatre_depenses.where(:nbr_users => 3, :destinataire_part => 0, :auto => 0).sum(:montant)
                        @mesdep4 = @colocataires[0].quatre_depenses.where(:nbr_users => 4, :destinataire_part => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4, :auto => 0).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep3inv/3 - @dep4inv/4


                        #pour le coloc 2 :
                        @mesdep1 = @colocataires[1].quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[1].quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[1].quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[1].quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @sesdep3 = @colocataires[1].quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 0, :auto => 0).sum(:montant)
                        @mesdep4 = @colocataires[1].quatre_depenses.where(:nbr_users => 4, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4, :auto => 0).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        #pour le coloc 3 :
                        @mesdep1 = @colocataires[2].quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[2].quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[2].quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[2].quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[2].quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @sesdep3 = @colocataires[2].quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 0, :auto => 0).sum(:montant)
                        @mesdep4 = @colocataires[2].quatre_depenses.where(:nbr_users => 4, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[2].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4, :auto => 0).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[2].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        #pour le coloc 4 :
                        @mesdep1 = @colocataires[3].quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                        @sesdep1 = @colocataires[3].quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 0, :auto => 0).sum(:montant)
                        @mesdep2 = @colocataires[3].quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                        @sesdep2 = @colocataires[3].quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 0, :auto => 0).sum(:montant)
                        @mesdep3 = @colocataires[3].quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                        @sesdep3 = @colocataires[3].quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 0, :auto => 0).sum(:montant)
                        @mesdep4 = @colocataires[3].quatre_depenses.where(:nbr_users => 4, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[3].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4, :auto => 0).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 1, :auto => 0).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[3].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        @sumdep1 = @colocataires[0].quatre_depenses.where(:auto =>0).sum(:montant)
                        @sumdep2 = @colocataires[1].quatre_depenses.where(:auto =>0).sum(:montant)
                        @sumdep3 = @colocataires[2].quatre_depenses.where(:auto =>0).sum(:montant)
                        @sumdep4 = @colocataires[3].quatre_depenses.where(:auto =>0).sum(:montant)
                elsif @nbrcoloc > 4
                  @arrayTot = Hash.new
                  @colocataires.each do |c|
                     @arrayTot[c.id] = 0
                  end

                  @expenses.each do |e|
                     # on ajoute pour la source
                     @arrayTot[e.user_id] += e.montant 
                     # on retire pour les parties
                     e.parties.each do |p|
                        @arrayTot[p.first.to_i] -= e.montant / e.nbr_users if p.last == "1"
                     end
                  end

                  # on redistribue les tot selon les colocs
                  @colocataires.reverse.each do |coloc, i|
                     coloc.tot = @arrayTot[coloc.id]
                  end 

                  # utile pour la remise à niveau
                  @arrayTotMod = @arrayTot
                  @hashRM = Array.new(@colocataires.size - 1) {Array.new(3) }

                  @i = 0
                  if @expenses.size != 0   
                  while @i < @colocataires.size - 1 
			  @arrayTotRM = @arrayTotMod.sort_by {|hsh| hsh[1]}.delete_if {|x| x[1] == 0}
			  break if @arrayTotRM == []
			  @ColocCourMal = User.find(@arrayTotRM.first.first)
			  @ColocCourMieux = User.find(@arrayTotRM.last.first)
			  @hashRM[@i][1] = @ColocCourMal.nom
			  @hashRM[@i][2] = [@arrayTotMod[@ColocCourMieux.id].abs, @arrayTotMod[@ColocCourMal.id].abs].min
			  @hashRM[@i][3] = @ColocCourMieux.nom

			  # on remet les champs à zéro
			  @arrayTotMod[@ColocCourMieux.id] -= @hashRM[@i][2]
			  @arrayTotMod[@ColocCourMal.id] += @hashRM[@i][2]

			  @i+=1
                  end
                  end
                   
                  # On supprime les cases inutiles de hashRM
                  @hashRM.delete_if {|x| x == [nil, nil, nil]}
                  

                end


                #calcul des dépenses automatiques :
                if @nbrcoloc == 2
                        @autodep1 = @colocataires[0].depenses.where(:auto => 1)
                        @autodep2 = @colocataires[1].depenses.where(:auto => 1)
                        @autodep = @autodep1 + @autodep2
                end
                if @nbrcoloc == 3
                        @autodep1 = @colocataires[0].trois_depenses.where(:auto => 1)
                        @autodep2 = @colocataires[1].trois_depenses.where(:auto => 1)
                        @autodep3 = @colocataires[2].trois_depenses.where(:auto => 1)
                        @autodep = @autodep1 + @autodep2 + @autodep3 
                end
                if @nbrcoloc == 4
                        @autodep1 = @colocataires[0].quatre_depenses.where(:auto => 1)
                        @autodep2 = @colocataires[1].quatre_depenses.where(:auto => 1)
                        @autodep3 = @colocataires[2].quatre_depenses.where(:auto => 1)
                        @autodep4 = @colocataires[3].quatre_depenses.where(:auto => 1)
                        @autodep = @autodep1 + @autodep2 + @autodep3 + @autodep4
                end
                if @nbrcoloc > 4
                   @autodepArray = Array.new
                   @colocataires.each do |c, i|
                     @autodepArray.push(c.expenses.where(:auto => 1))
                   end
                   @autodep = @autodepArray.inject(:+)
                end
        end 

        def choixnbr 
                @coloc = Coloc.find(params[:id])
                @nbrcoloc = @coloc.users.size
                @user = current_user
                @titre = "Nouvelle dépense pour "
        end

        def destroy
                @coloc = Coloc.find(params[:id])
                @coloc.destroy
                flash[:success] = t('flash.colocDestr') 
                redirect_to colocs_path
        end

        def coloc_manquante
                flash[:error] = t('flash.colocManq')
                redirect_to colocs_path	     
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

        def list
                @titre = "Toutes les Colocations"
                @colocs = Coloc.all
		        @caTotal = Coloc.sum(:ca)
        end
		
		def verify_coloc
			render :status => 409 unless Coloc.where('lower(nom) = ?', params[:nom].downcase).first.nil? || (params[:prev_name] && params[:prev_name] == params[:nom])
		end

        private

        def sort_column
                Coloc.column_names.include?(params[:sort]) ? params[:sort] : "ca"
        end

        def sort_direction
                %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
        end
end            
