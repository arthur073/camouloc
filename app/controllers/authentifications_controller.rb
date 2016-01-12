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
		flash[:success] = t("main.authsuccess", :auth_hash => auth_hash["provider"].capitalize)
		redirect_to Coloc.find(user.coloc_id)
	elsif signed_in?
		# Add the authorization to the user
		current_user.add_provider(auth_hash)
		flash[:success] = t("main.authsuccess2", :auth_hash => auth_hash["provider"].capitalize)
		redirect_to Coloc.find(current_user.coloc_id)
	else
		# Create user using classical path
		auth = Authentification.find_or_create(auth_hash)
		redirect_to register_provider_path(:user_id => auth.user.id)
	end
  end
  
  def failure
	flash[:error] = t("main.authfailure")
	redirect_to signup_path
  end
  
  def destroy
    @authentification = current_user.authentifications.find(params[:id])
    @authentification.destroy
    flash[:notice] = t('flash.authDestroy')
    redirect_to authentifications_url
  end
end
