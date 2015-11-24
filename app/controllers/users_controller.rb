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
      @coloc = Coloc.find(@user.coloc_id)
	  @roommates = @coloc.users.order(:created_at)
	  @most_recent_colocataire = @roommates.last
	  
	  # Crunching data to create timeline
	  user_number = @roommates.count
	  @expenses = []
	  if user_number <= 2
		  @expenses = Depense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id]}, :order => "created_at ASC")
	  elsif user_number == 3
  		  @expenses = TroisDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id]}, :order => "created_at ASC")
	  elsif user_number == 4
		  @expenses = QuatreDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id, @roommates[3].id]}, :order => "created_at ASC")
	  elsif user_number > 4
		  @expenses = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", @roommates.map { |c| c.id }])
		  @expenses.delete_if {|item| item == [] } #or item.auto == 1 } 
	  end
	  @most_recent_expense = @expenses.last unless @expenses == []
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
         flash[:error] = "Something went wrong, please try again"
         redirect_to signup_path
      end
   end

   def edit
   end

   def update   
      user = User.find(params[:id])
	  user.nom = params[:user][:nom]
	  user.email = params[:email]
	  user.password = params[:user][:password]
	  
      if user.save
         redirect_to user
         flash[:success] = "Profile successfully updated"
      else
         flash[:error] = "Something went wrong when editing your profile, please try again"
         redirect_to user
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
		render :status => 409 unless User.where('lower(email) = ?', params[:email].downcase).first.nil? || (params[:prev_email] && params[:prev_email] == params[:email])
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
                name = params[:email].split("@")[0].split(".").map {|n| n.capitalize }.join(" ")
                @roommate.nom = name
                # passwords
                pass = SecureRandom.hex(4)
                @roommate.password = pass
                @roommate.password_confirmation = pass
                # coloc id
                @roommate.coloc_id = @coloc.id
                # image
                @roommate.set_image

                
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
   
  def remove_roommate
        if params[:id] && params[:secret]
            @user = User.find(params[:id])
            @coloc = Coloc.find(@user.coloc_id)
            if @coloc.secret.eql? params[:secret]
                # removing user
                @user.destroy
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
