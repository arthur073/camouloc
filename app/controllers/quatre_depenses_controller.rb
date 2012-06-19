# -*- encoding : utf-8 -*-
class QuatreDepensesController < ApplicationController
        def new
                @quatredepense = QuatreDepense.new
                @titre = "Nouvelle dépense pour " + current_user.nom
                @colocataires = User.where(:coloc_id => current_user.coloc_id).all
        end

        def create
                @quatredepense = QuatreDepense.new(params[:quatre_depense])
                @quatredepense.user_id = current_user.id
                @quatredepense.nbr_users = @quatredepense.destinataire_part + @quatredepense.destinataire_part2 + @quatredepense.destinataire_part3+ @quatredepense.destinataire_part4
                if @quatredepense.save
                        #Traite un succès d'enregistrement.
                        #envoie le mail de confirmation de la dépense
                        DepenseMailer.new_depense_email(@quatredepense).deliver
                        flash[:success] = "Dépense enregistrée!"
                        redirect_to current_user
                else
                        @titre = "Nouvelle dépense pour " + current_user.nom
                        render 'new'
                end
        end

        def destroy
                @quatredepense = QuatreDepense.find(params[:id])
                @quatredepense.destroy
                flash[:success] = "Dépense supprimée."
                redirect_to(:back)
        end


end
