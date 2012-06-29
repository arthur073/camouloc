# -*- encoding : utf-8 -*-
class TroisDepensesController < ApplicationController
        before_filter :require_login

        def new
                @troisdepense = TroisDepense.new
                @titre = "Nouvelle dépense pour " + current_user.nom
                @colocataires = User.where(:coloc_id => current_user.coloc_id).all
        end

        def create
                @troisdepense = TroisDepense.new(params[:trois_depense])
                @troisdepense.user_id = current_user.id
                # ajoute la somme dépensée au Chiffre d'Affaires
                @colocation = Coloc.find(current_user.coloc_id)
                @colocation.ca = @colocation.ca + @troisdepense.montant
                @colocation.save

                @troisdepense.nbr_users = @troisdepense.destinataire_part + @troisdepense.destinataire_part2 + @troisdepense.destinataire_part3
                if @troisdepense.save
                        #Traite un succès d'enregistrement.
                        #envoie le mail de confirmation de la dépense
                        DepenseMailer.new_depense_email(@troisdepense).deliver
                        flash[:success] = "Dépense enregistrée!"
                        redirect_to current_user
                else
                        @titre = "Nouvelle dépense pour " + current_user.nom
                        render 'new'
                end
        end

        def destroy
                @troisdepense = TroisDepense.find(params[:id])
                @troisdepense.destroy
                @colocation = Coloc.find(current_user.coloc_id)
                @colocation.ca = @colocation.ca - @troisdepense.montant
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
