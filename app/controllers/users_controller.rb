# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :admin_user,   :only => :destroy
	before_filter :correct_user, :only => [:edit, :update]
	rescue_from ActiveRecord::RecordNotFound, :with => :user_manquant

	def index
		@titre = "Tous les utilisateurs"
		@users = User.paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@user = User.find(params[:id])
		@titre = @user.nom
                @coloc = Coloc.find(@user.coloc_id)
                @colocataires = @coloc.users.all
                if @colocataires.size == 2 
                        @liste1 = @user.depenses.all
                        @nbrdep = @liste1.size
                elsif  @colocataires.size == 3 
                        @liste2 = @user.trois_depenses.all
                        @nbrdep = @liste2.size
                elsif  @colocataires.size == 4
                        @liste3 = @user.quatre_depenses.all
                        @nbrdep = @liste3.size
                else
                        @nbrdep = 0
                end
	end

	def new
		@user = User.new
		@titre = "Inscription"
		@user.coloc_id = Coloc.find(params[:coloc_id]).id
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			# Traite un succès d'enregistrement.
			# Envoie un email de bienvenue
			UserMailer.welcome_email(@user).deliver
			unless signed_in?
				sign_in @user
			end
			redirect_to Coloc.find(@user.coloc_id)
			flash[:success] = "Utilisateur enregistré !"
		else
			flash[:error] = "Cet email existe déjà"
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
			flash[:success] = "Profil actualisé"
		else
			@titre = "Edition profil"
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "Utilisateur supprimé."
		redirect_to users_path
	end

	def user_manquant
		flash[:error] = "Cet utilisateur n'existe pas."
     	 	redirect_to users_path	     
	end

	private

	def authenticate
		deny_access unless signed_in?
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end
end
