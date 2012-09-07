# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, :with => :coloc_manquante
        helper_method :sort_column, :sort_direction

        def show
                @coloc = Coloc.find(params[:id])
                @titre = @coloc.nom
                @liste = @coloc.users.order(:nom) 
        end

        def index
                @titre = "Palmarès des colocs"
                @colocs = Coloc.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
                @colocs2 = Coloc.where(:palm=>1).order(:ca)
        end

        def new
                @coloc = Coloc.new
                @coloc.palm = 1
                @titre = "Inscription de la Colocation"
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
                @colocataires = @coloc.users
                @titre = "Tableau de bord"

                #calcul des dettes :
                if @nbrcoloc == 2
                        #pour le coloc 1 :
                        @sesdep1 = @colocataires[0].depenses.where(:nbr_users => 1, :destinataire_part => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep2inv = @dep2inv + colocataires2.depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2  - @dep1inv - @dep2inv/2 

                        #pour le coloc 2 :
                        @sesdep1 = @colocataires[1].depenses.where(:nbr_users => 1, :destinataire_part2 => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep2inv = @dep2inv + colocataires2.depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.depenses.where(:nbr_users => 1, :destinataire_part2 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2  - @dep1inv - @dep2inv/2 
                        @sumdep1 = @colocataires[0].depenses.sum(:montant)
                        @sumdep2 = @colocataires[1].depenses.sum(:montant)

                elsif @nbrcoloc == 3
                        #pour le coloc 1 :
                        #@mesdep1 = @colocataires[0].trois_depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                        @sesdep1 = @colocataires[0].trois_depenses.where(:nbr_users => 1, :destinataire_part => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].trois_depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                        @sesdep2 = @colocataires[0].trois_depenses.where(:nbr_users => 2, :destinataire_part => 0).sum(:montant)
                        @mesdep3 = @colocataires[0].trois_depenses.where(:nbr_users => 3, :destinataire_part => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3  - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        #pour le coloc 2 :
                        @mesdep1 = @colocataires[1].trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 1).sum(:montant)
                        @sesdep1 = @colocataires[1].trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                        @sesdep2 = @colocataires[1].trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 0).sum(:montant)
                        @mesdep3 = @colocataires[1].trois_depenses.where(:nbr_users => 3, :destinataire_part2 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part2 => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part2 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        #pour le coloc 3 :
                        @mesdep1 = @colocataires[2].trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 1).sum(:montant)
                        @sesdep1 = @colocataires[2].trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 0).sum(:montant)
                        @mesdep2 = @colocataires[2].trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 1).sum(:montant)
                        @sesdep2 = @colocataires[2].trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 0).sum(:montant)
                        @mesdep3 = @colocataires[2].trois_depenses.where(:nbr_users => 3, :destinataire_part3 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[2].id != colocataires2.id 
                                        @dep3inv = @dep3inv + colocataires2.trois_depenses.where(:nbr_users => 3, :destinataire_part3 => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.trois_depenses.where(:nbr_users => 2, :destinataire_part3 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.trois_depenses.where(:nbr_users => 1, :destinataire_part3 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[2].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 - @dep1inv - @dep2inv/2 - @dep3inv/3 

                        @sumdep1 = @colocataires[0].trois_depenses.sum(:montant)
                        @sumdep2 = @colocataires[1].trois_depenses.sum(:montant)
                        @sumdep3 = @colocataires[2].trois_depenses.sum(:montant)


                elsif @nbrcoloc == 4
                        #pour le coloc 1 :
                        @mesdep1 = @colocataires[0].quatre_depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                        @sesdep1 = @colocataires[0].quatre_depenses.where(:nbr_users => 1, :destinataire_part => 0).sum(:montant)
                        @mesdep2 = @colocataires[0].quatre_depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                        @sesdep2 = @colocataires[0].quatre_depenses.where(:nbr_users => 2, :destinataire_part => 0).sum(:montant)
                        @mesdep3 = @colocataires[0].quatre_depenses.where(:nbr_users => 3, :destinataire_part => 1).sum(:montant)
                        @sesdep3 = @colocataires[0].quatre_depenses.where(:nbr_users => 3, :destinataire_part => 0).sum(:montant)
                        @mesdep4 = @colocataires[0].quatre_depenses.where(:nbr_users => 4, :destinataire_part => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[0].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[0].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep3inv/3 - @dep4inv/4


                        #pour le coloc 2 :
                        @mesdep1 = @colocataires[1].quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 1).sum(:montant)
                        @sesdep1 = @colocataires[1].quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 0).sum(:montant)
                        @mesdep2 = @colocataires[1].quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                        @sesdep2 = @colocataires[1].quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 0).sum(:montant)
                        @mesdep3 = @colocataires[1].quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 1).sum(:montant)
                        @sesdep3 = @colocataires[1].quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 0).sum(:montant)
                        @mesdep4 = @colocataires[1].quatre_depenses.where(:nbr_users => 4, :destinataire_part2 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[1].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part2 => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part2 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part2 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[1].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        #pour le coloc 3 :
                        @mesdep1 = @colocataires[2].quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 1).sum(:montant)
                        @sesdep1 = @colocataires[2].quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 0).sum(:montant)
                        @mesdep2 = @colocataires[2].quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 1).sum(:montant)
                        @sesdep2 = @colocataires[2].quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 0).sum(:montant)
                        @mesdep3 = @colocataires[2].quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 1).sum(:montant)
                        @sesdep3 = @colocataires[2].quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 0).sum(:montant)
                        @mesdep4 = @colocataires[2].quatre_depenses.where(:nbr_users => 4, :destinataire_part3 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[2].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part3 => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part3 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part3 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[2].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        #pour le coloc 4 :
                        @mesdep1 = @colocataires[3].quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 1).sum(:montant)
                        @sesdep1 = @colocataires[3].quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 0).sum(:montant)
                        @mesdep2 = @colocataires[3].quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 1).sum(:montant)
                        @sesdep2 = @colocataires[3].quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 0).sum(:montant)
                        @mesdep3 = @colocataires[3].quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 1).sum(:montant)
                        @sesdep3 = @colocataires[3].quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 0).sum(:montant)
                        @mesdep4 = @colocataires[3].quatre_depenses.where(:nbr_users => 4, :destinataire_part4 => 1).sum(:montant)
                        @dep1inv = 0
                        @dep2inv = 0
                        @dep3inv = 0
                        @dep4inv = 0
                        @colocataires.each do |colocataires2|
                                if @colocataires[3].id != colocataires2.id 
                                        @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                        @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3, :destinataire_part4 => 1).sum(:montant)
                                        @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2, :destinataire_part4 => 1).sum(:montant)
                                        @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1, :destinataire_part4 => 1).sum(:montant)
                                end
                        end
                        #calcul du total
                        @colocataires[3].tot = @sesdep1 + @mesdep2/2 + @sesdep2 + @mesdep3*2/3 + @sesdep3 + @mesdep4*3/4 - @dep1inv - @dep2inv/2 - @dep4inv/4 - @dep3inv/3

                        @sumdep1 = @colocataires[0].quatre_depenses.sum(:montant)
                        @sumdep2 = @colocataires[1].quatre_depenses.sum(:montant)
                        @sumdep3 = @colocataires[2].quatre_depenses.sum(:montant)
                        @sumdep4 = @colocataires[3].quatre_depenses.sum(:montant)
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


        private

        def sort_column
                Coloc.column_names.include?(params[:sort]) ? params[:sort] : "ca"
        end

        def sort_direction
                %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
        end
end
