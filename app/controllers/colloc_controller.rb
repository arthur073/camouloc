# -*- encoding : utf-8 -*-
class CollocController < ApplicationController

	def show
		#@colloc = Colloc.find(params[:nom])
		#@colloc=Colloc.new(:nom => "Arhtur") 
		render 'new'
    		#@titre = @colloc.nom
	end

	def index
		@titre = "Toutes les collocs"
		@colloc = Colloc.paginate(:page => params[:page])
	end

	def new
		@colloc = Colloc.new
		@titre = "Inscription de la Collocation"
	end

	def create
		@colloc = Colloc.new(params[:colloc])
		if @colloc.save
			# Traite un succès d'enregistrement.
			# sign_in @user
			redirect_to @colloc
			#flash[:success] = "Votre collocation a bien été enregistrée !"
		else
			#flash[:error] = "Votre collocation n'a pas été enregistrée !"
			@titre = "Inscription de la Collocation"
			render 'new'
		end
	end

end
