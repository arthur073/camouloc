# -*- encoding : utf-8 -*-
class ColocsController < ApplicationController
		rescue_from ActiveRecord::RecordNotFound, :with => :coloc_manquante

	def show
		@coloc = Coloc.find(params[:id])
		@titre = @coloc.nom
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
		@titre = "Tableau de bord"
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
