# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, :with => :coloc_manquante

        def show
                @coloc = Coloc.find(params[:id])
                @titre = @coloc.nom
                @liste = @coloc.users.all 
                #@ = @coloc.users.where(:coloc_id => @coloc.id)
        end

        def index
                @titre = "Toutes les colocs"
                @colocs = Coloc.paginate(:page => params[:page], :per_page => 10)

        end

        def new
                @coloc = Coloc.new
                @titre = "Inscription de la Colocation"
        end

        def create
                @coloc = Coloc.new(params[:coloc])
                if @coloc.save
                        # Traite un succès d'enregistrement.
                        redirect_to @coloc
                        flash[:success] = "Votre colocation a bien été enregistrée !"
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
                if @nbrcoloc == 4
                        @colocataires.each do |colocataires|
                                @dep4inv = 0
                                @dep3inv = 0
                                @dep2inv = 0
                                @dep1inv = 0

                                @dep4 = colocataires.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                @dep3 = colocataires.quatre_depenses.where(:nbr_users => 3).sum(:montant)
                                @dep2 = colocataires.quatre_depenses.where(:nbr_users => 2).sum(:montant)
                                @dep1 = colocataires.quatre_depenses.where(:nbr_users => 1).sum(:montant)
                                @colocataires.each do |colocataires2|
                                        if colocataires.id != colocataires2.id 
                                                @dep4inv = @dep4inv + colocataires2.quatre_depenses.where(:nbr_users => 4).sum(:montant)
                                                @dep3inv = @dep3inv + colocataires2.quatre_depenses.where(:nbr_users => 3).sum(:montant)
                                                @dep2inv = @dep2inv + colocataires2.quatre_depenses.where(:nbr_users => 2).sum(:montant)
                                                @dep1inv = @dep1inv + colocataires2.quatre_depenses.where(:nbr_users => 1).sum(:montant)
                                        end
                                end
                                #prendre en compte l'appartenance à une dépense ou non 
                                colocataires.tot = 3*@dep4/4 + 2*@dep3/3 + @dep2/2 + @dep1 - @dep4inv/4 - @dep3inv/3 - @dep2inv/2 - @dep1inv
                        end
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
                        flash[:success] = "Nom actualisé"
                else
                        @titre = "Edition Colocation"
                        render 'edit'
                end
        end
end
