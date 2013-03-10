# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
        #rescue_from ActiveRecord::RecordNotFound, :with => :coloc_manquante
        helper_method :sort_column, :sort_direction

        def show
                @coloc = Coloc.find(params[:id])
                @titre = @coloc.nom
                @liste = @coloc.users.order(:created_at) 
                @messagespubl = @coloc.messages.where(:private=>0).order(:created_at).reverse.paginate(:page => params[:page], :per_page => 6)
                @messagespriv = @coloc.messages.where(:private=>1).order(:created_at).reverse.paginate(:page => params[:page], :per_page => 6)
                @param1 = params[:param1] # "value1"
                @colocs = Coloc.where(:palm=>1).order(:ca)
                @pleine = false
                Expense.all.each do |e|
                  if User.find(e.parties.first.first.to_i).coloc_id == @coloc.id
                     @pleine = true
                  end
                end
        end

        def index
                @titre = "Palmarès des colocs"
                @colocs = Coloc.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
                @colocs3 = Coloc.where(:palm=>1).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
                @colocs2 = Coloc.where(:palm=>1).order(:ca)
        end

        def new
                @coloc = Coloc.new
                @coloc.palm = 1
                @titre = "Inscription de la Colocation"
                @nb_colocs = Coloc
               
                @colocs = Coloc.all
                @nbrcolocs_vides = 0
                @colocs.each do |col|
                  if (col.users.size == 0)
                        @nbrcolocs_vides = @nbrcolocs_vides + 1
                  end
                end
        end

        def create
                @coloc = Coloc.new(params[:coloc])
                @coloc.ca = 0
                if @coloc.save
                        # Traite un succès d'enregistrement.
                        redirect_to @coloc
                        flash[:success] = "Votre colocation a bien été enregistrée ! Inscrivez maintenant vos colocataires."
                        UserMailer.colocemail(@coloc).deliver
                else
                        flash[:error] = "Votre colocation n'a pas été enregistrée ! Le nom utilisé n'est pas disponible."
                        @titre = "Inscription de la Colocation"
                        render 'new'
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
                        flash[:error] = "Vous n'avez pas accès au tableau de bord de cette colocation."
                        redirect_to Coloc.find(current_user.coloc_id)
                end

                if @coloc.users.count < 2
                        # si la coloc n'a qu'un user, son tableau de bord n'existe pas
                        flash[:error] = "Inscrivez tous les colocataires avant d'accéder au tableau de bord."
                        redirect_to @coloc
                end

                #calcul des dettes :
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
                flash[:success] = "Colocation supprimée."
                redirect_to colocs_path
        end

        def coloc_manquante
                flash[:error] = "Cette colocation n'existe pas."
                redirect_to colocs_path	     
        end

        def edit
                @coloc = Coloc.find(params[:id])
                @titre = "Edition Colocation"
        end

        def update
                @coloc = Coloc.find(params[:id])
                if @coloc.update_attributes(params[:coloc])
                        redirect_to @coloc
                        flash[:success] = "Colocation actualisée"
                else
                        @titre = "Edition Colocation"
                        render 'edit'
                end
        end

        def list
                @titre = "Toutes les Colocations"
                @colocs = Coloc.order(:created_at).paginate(:page => params[:page], :per_page => 9)
        end

        private

        def sort_column
                Coloc.column_names.include?(params[:sort]) ? params[:sort] : "ca"
        end

        def sort_direction
                %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
        end
end
