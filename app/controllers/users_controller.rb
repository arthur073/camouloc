# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
   before_filter :authenticate, :only => [:edit, :update]
   before_filter :admin_user,   :only => :destroy
   before_filter :correct_user, :only => [:edit, :update]
   #rescue_from ActiveRecord::RecordNotFound, :with => :user_manquant
   layout 'dashboard'

   def index
      @titre = "Tous les utilisateurs"
      @users = User.all(:order => "created_at ASC").paginate(:page => params[:page], :per_page => 30)
      @usersAll = User.all
      @depTotal = Depense.all.size + TroisDepense.all.size + QuatreDepense.all.size + Expense.all.size
   end

   def show
      @user = User.find(params[:id])
      @faceb_url = "http://camouloc.herokuapp.com/auth/facebook"
      @titre = @user.nom
      @coloc = Coloc.find(@user.coloc_id)
      @colocataires = @coloc.users.order(:created_at)
      if @colocataires.size == 2 
         @liste1 = @user.depenses.where(:auto => 0).order(:created_at)
         @nbrdep = @liste1.size
      elsif  @colocataires.size == 3 
         @liste2 = @user.trois_depenses.where(:auto => 0).order(:created_at)
         @liste1 = @liste2 if mobile_device?
         @nbrdep = @liste2.size
      elsif  @colocataires.size == 4
         @liste3 = @user.quatre_depenses.where(:auto => 0).order(:created_at)
         @liste1 = @liste3 if mobile_device?
         @nbrdep = @liste3.size
      elsif @colocataires.size > 4
         @expenses = Expense.where(:user_id => @user.id, :auto => 0)
         @nbrdep = @expenses.size
      else
         @nbrdep = 0
      end
   end

   def new
   end

   def create
      @user = User.new(params[:user])
      @coloc_id = @user.coloc_id

      if @user.save
         # Traite un succès d'enregistrement.
         # Envoie un email de bienvenue
         UserMailer.welcome_email(@user).deliver
         unless signed_in?
            sign_in @user
         end
		 redirect_to new_user_path(:coloc_id => @coloc_id)
         flash[:success] = t('flash.userCreate')
      else
         #@titre = "Inscription"
         @coloc = Coloc.find(@coloc_id)
         render 'session#new'
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
         flash[:success] = t('flash.userUp')
      else
         @titre = "Edition profil"
         render 'edit'
      end
   end

   def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = t('flash.userDel')
      redirect_to root_path
   end

   def user_manquant
      flash[:error] = t('flash.userManq')
      redirect_to users_path	     
   end
   
   def verify_user
		render :status => 409 unless User.where('lower(email) = ?', params[:email].downcase).first.nil?
   end

   def add_roommate
        if params[:email] && params[:user_id] && params[:secret]
            @user = User.find(params[:user_id])
            @coloc = Coloc.find(@user.coloc_id)
            if @coloc.secret.eql? params[:secret]
                # email
                @roommate = User.new
                @roommate.email = params[:email]
                # name
                name = params[:email].split("@")[0].split(".").map {|n| n.gsub(/[^a-zA-Z]/, '').capitalize }.join(" ")
                @roommate.nom = name
                # passwords
                pass = SecureRandom.hex(4)
                @roommate.password = pass
                @roommate.password_confirmation = pass
                # coloc id
                @roommate.coloc_id = @coloc.id
                
                if @roommate.save
                    
                else
                    flash[:error] = "Ouch... unable to add your roommate. Please try again."
                    redirect_to create_users_path(:user => @user, :secret => @coloc.secret)
                end
            else
                render :status => 404
            end
        else
		    render :status => 404
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

   def admin_user
      redirect_to(root_path) unless current_user.admin?
   end
end
