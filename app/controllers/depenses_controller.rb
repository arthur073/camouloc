# -*- encoding : utf-8 -*-
class DepensesController < ApplicationController
	def new
		@depense = Depense.new
		@titre = "Nouvelle dépense pour " + current_user.nom
		@colocataires = User.where(:coloc_id => current_user.coloc_id).all
		# permet de trouver le colocataire de current_user
		if current_user.id == @colocataires.first.id
			@depense.destinataire_id = @colocataires.last.id
		else
			@depense.destinataire_id = @colocataires.first.id
		end

	end

	def create
		@depense = Depense.new(params[:depense])
		@depense.user_id = current_user.id
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

end
