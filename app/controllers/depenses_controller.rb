# -*- encoding : utf-8 -*-
class DepensesController < ApplicationController
        before_filter :require_login


        def new
                @depense = Depense.new
                @titre = "Nouvelle dépense"
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)

        end

        def create
                @depense = Depense.new(params[:depense])
                @depense.nbr_users = @depense.destinataire_part + @depense.destinataire_part2
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)

                if @depense.save
                        #Traite un succès d'enregistrement.
			# ajoute la somme dépensée au Chiffre d'Affaires
			@colocation = Coloc.find(current_user.coloc_id)
			@colocation.ca = @colocation.ca + @depense.montant
			@colocation.save
                        #envoie le mail de confirmation de la dépense
                        if (@colocation.users.where(:mail => 1).size != 0 )
                                DepenseMailer.new_depense_email(@depense).deliver
                        end 
                        flash[:success] = "Dépense enregistrée!"
                        redirect_to User.find(@depense.user_id)
                else
                        @titre = "Nouvelle dépense"
                        render 'new'
                end
        end

        def destroy
                @depense = Depense.find(params[:id])
                @depense.destroy
                @colocation = Coloc.find(current_user.coloc_id)
                @colocation.ca = @colocation.ca - @depense.montant
                @colocation.save

                flash[:success] = "Dépense supprimée."
                redirect_to(:back)
        end

        private
        def require_login
                unless current_user
                        flash[:notice] = "Vous devez vous identifier pour accéder à cette page. "
                        redirect_to login_path
                end
        end

end
