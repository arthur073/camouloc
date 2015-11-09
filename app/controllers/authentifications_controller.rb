# -*- encoding : utf-8 -*-
class AuthentificationsController < ApplicationController
  def index
  end
  
  def create
	  auth_hash = request.env['omniauth.auth']
	  user = User.where(:email => auth_hash[:info][:email]).first
	  	
	if user.present?
		# Sign him in and add authorization
		sign_in user
		user.add_provider(auth_hash)
		flash[:success] = "You logged in successfully using #{auth_hash["provider"].capitalize} !"
		redirect_to Coloc.find(user.coloc_id)
	elsif signed_in?
		# Add the authorization to the user
		current_user.add_provider(auth_hash)
		flash[:success] = "You can now login using #{auth_hash["provider"].capitalize} too!"
		redirect_to Coloc.find(current_user.coloc_id)
	else
		# Create user using classical path
		auth = Authentification.find_or_create(auth_hash)
		redirect_to register_provider_path(:user_id => auth.user.id)
	end
  end
  
  def failure
	flash[:error] = "Sorry, but you didn't allow access to our app! Please use the form below instead"
	redirect_to signup_path
  end
  
  def destroy
    @authentification = current_user.authentifications.find(params[:id])
    @authentification.destroy
    flash[:notice] = t('flash.authDestroy')
    redirect_to authentifications_url
  end
end
