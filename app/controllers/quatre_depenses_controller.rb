# -*- encoding : utf-8 -*-
class QuatreDepensesController < ApplicationController
        before_filter :require_login

        def new
                @quatredepense = QuatreDepense.new
                @titre = "Nouvelle dépense"
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
        end

        def create
                @quatredepense = QuatreDepense.new(params[:quatre_depense])
                @quatredepense.nbr_users = @quatredepense.destinataire_part + @quatredepense.destinataire_part2 + @quatredepense.destinataire_part3+ @quatredepense.destinataire_part4
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)

                if @quatredepense.save
                        #Traite un succès d'enregistrement.
                        #envoie le mail de confirmation de la dépense
			# ajoute la somme dépensée au Chiffre d'Affaires
			@colocation = Coloc.find(current_user.coloc_id)
			@colocation.ca = @colocation.ca + @quatredepense.montant
			@colocation.save
                        # recherche de tous les utilisateurs
                        if (@colocation.users.where(:mail => 1).size != 0 )
                        begin
                           DepenseMailer.new_depense_email(@quatredepense).deliver
                        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
                           flash[:info] = 'Votre dépense a été correctement soumise, cependant le mail n\'a pas été envoyé à cause d\'un problème sur
                           le serveur de mails.' + "\n" + e.message
                        else
                           flash[:success] = "Dépense enregistrée!"
                        end
                        end 
                        redirect_to User.find(@quatredepense.user_id)
                else
                        @titre = "Nouvelle dépense"
                        render 'new'
                end
        end

        def destroy
                @quatredepense = QuatreDepense.find(params[:id])
                @quatredepense.destroy
                @colocation = Coloc.find(current_user.coloc_id)
                @colocation.ca = @colocation.ca - @quatredepense.montant
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
