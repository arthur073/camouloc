# -*- encoding : utf-8 -*-
class TroisDepensesController < ApplicationController
        before_filter :require_login

        def new
                @troisdepense = TroisDepense.new
                @titre = "Nouvelle dépense"
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
        end

        def create
                @troisdepense = TroisDepense.new(params[:trois_depense])
                @troisdepense.nbr_users = @troisdepense.destinataire_part + @troisdepense.destinataire_part2 + @troisdepense.destinataire_part3
                @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
                if @troisdepense.save
                        #Traite un succès d'enregistrement.
			# ajoute la somme dépensée au Chiffre d'Affaires
			@colocation = Coloc.find(current_user.coloc_id)
			@colocation.ca = @colocation.ca + @troisdepense.montant
			@colocation.save
                        #envoie le mail de confirmation de la dépense
                        # recherche de tous les utilisateurs
                        if (@colocation.users.where(:mail => 1).size != 0 )
                        begin
                           DepenseMailer.new_depense_email(@troisdepense).deliver
                        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
                           flash[:info] = 'Votre dépense a été correctement soumise, cependant le mail n\'a pas été envoyé à cause d\'un problème sur
                           le serveur de mails.' + "\n" + e.message
                        else
                           flash[:success] = "Dépense enregistrée!"
                        end
                        end 
                        redirect_to User.find(@troisdepense.user_id)
                else
                        @titre = "Nouvelle dépense"
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
