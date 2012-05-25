# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]

	def index
		@titre = "Tous les utilisateurs"
		@users = User.paginate(:page => params[:page])
	end

	def show
		@user = User.find(params[:id])
		@titre = @user.nom
	end

	def new
		@user = User.new
		@titre = "Inscription"
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			# Traite un succès d'enregistrement.
			sign_in @user
			redirect_to @user
			flash[:success] = "Bienvenue dans l'Application Exemple!"
		else
			@titre = "Inscription"
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
		@titre = "Edition Profil"
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user
			flash[:success] = "Profil actualise"
		else
			@titre = "Edition profil"
			render 'edit'
		end
	end

	private

	def authenticate
		deny_access unless signed_in?
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
end
