# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

   rescue_from ActiveRecord::RecordNotFound, :with => :user_manquant    
   layout 'dashboard'
   before_filter :require_login, :only => [:show, :destroy, :edit, :update, :user_manquant]


   def show
      @user = User.find(params[:id])      
      @coloc = Coloc.find(@user.coloc_id)
      
      # Avoiding confidential data leak      
	  if @user.coloc_id != current_user.coloc_id
        flash[:warning] = t("main.unabletoseeuser")
		redirect_to(current_user)
		return
      end  
      
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
		  # @expenses.delete_if {|item| item == [] or item.auto == 1 } 
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
		 sign_in @user
		 redirect_to new_user_path(:coloc_id => @coloc_id)
         flash[:success] = t("main.useraccountcreatedsuccess")
      else
         flash[:error] = t("main.useraccountcreatedfailure")
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
         flash[:success] = t("main.updateprofilesuccess")
      else
         flash[:error] = t("main.updateprofilefailure")
         redirect_to user
      end
   end

   def user_manquant
      flash[:error] = t("main.unabletofinduser")
      redirect_to current_user    
   end
   
   def verify_user
		render :status => 409 unless User.where('lower(email) = ?', params[:email].downcase).first.nil? || (params[:prev_email] && params[:prev_email] == params[:email])
   end

   def add_roommate
        if !params[:name].blank? && !params[:user_id].blank? && !params[:secret].blank?
            @user = User.find(params[:user_id])
            @coloc = Coloc.find(@user.coloc_id)
            if @coloc.secret.eql? params[:secret]
                # email
                @roommate = User.new
				if !params[:email].blank?
					@roommate.email = params[:email]
				else
					@roommate.email = params[:name].downcase.gsub(/[^0-9a-z]/i, '') + "@camouloc.fr"
				end
                # name
                name = params[:name]
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
					_first_roommate = @coloc.users.order(:created_at).first
					begin
					UserMailer.welcome_email(@roommate,_first_roommate).deliver
					rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
						flash[:success] = t("main.usercreatedemailfailure")
					end
                else
                    flash[:warning] = t("main.usercreatedfailure")
					render :status => 409
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
end
