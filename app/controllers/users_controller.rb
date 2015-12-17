# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

   rescue_from ActiveRecord::RecordNotFound, :with => :user_manquant    
   layout 'dashboard'
   before_filter :require_login, :only => [:show, :destroy, :edit, :update, :user_manquant]


   def show
      @user = User.find(params[:id])      
      @coloc = Coloc.find(@user.coloc_id)
      
      # Avoiding confidential data leak      
      redirect_if_wrong_user(@user)
      
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
		  @expenses.delete_if {|item| item == [] or item.auto == 1 } 
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
      flash[:error] = "Error: unable to find this user"
      redirect_to current_user    
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
					# Send an email to welcome the user
					_roommate = @coloc.users.order(:created_at).first
					begin
					UserMailer.welcome_email(@user,_roommate).deliver
					rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
						flash[:success] = "User created, but unable to send him an email"
					end
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

   def redirect_if_wrong_user(_user)
      if _user.coloc_id != current_user.coloc_id
        flash[:warning] = "Oops! You are not able to see this user's data"
        redirect_to(current_user)
      end      
   end
end
