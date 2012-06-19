# -*- encoding : utf-8 -*-
class DepensesController < ApplicationController
        before_filter :require_login
        def new
                @depense = Depense.new
                @titre = "Nouvelle dépense pour " + current_user.nom
                @colocataires = User.where(:coloc_id => current_user.coloc_id).all
        end

        def create
                @depense = Depense.new(params[:depense])
                @depense.user_id = current_user.id
                @depense.nbr_users = @depense.destinataire_part + @depense.destinataire_part2
                if @depense.save
                        #Traite un succès d'enregistrement.
                        #envoie le mail de confirmation de la dépense
                        DepenseMailer.new_depense_email(@depense).deliver
                        flash[:success] = "Dépense enregistrée!"
                        redirect_to current_user
                else
                        @titre = "Nouvelle dépense pour " + current_user.nom
                        render 'new'
                end
        end

        def destroy
                @depense = Depense.find(params[:id])
                @depense.destroy
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
