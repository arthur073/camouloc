# -*- encoding : utf-8 -*-
class AuthentificationsController < ApplicationController
  def index
    @authentifications = current_user.authentifications if current_user
  end
  
  def create
    auth = request.env["omniauth.auth"] #omniauth.auth ?
	if signed_in? 
		current_user.authentifications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
		flash[:notice] = "Nous avons correctement lié votre profil #{auth['provider']}."
		redirect_to authentifications_url
	else 
		# l'utilisateur n'est pas connecté
		@authent = Authentification.where(:uid=>auth['uid'], :provider=>auth['provider'])
		User.all.each do |users|
			@auth = users.authentifications
			@auth.each do |auth| 
				if auth.uid == auth['uid'] && auth.provider == auth['provider'] 
					@user = users
				end
			end
		end

		if @user != nil
			sign_in @user
			redirect_to @user
		else 
			flash[:error] = "Aucun partenariat trouvé, vous devez d'abord configurer le partenariat depuis votre profil."
			redirect_to login_path
		end
	end
  end
  
  def destroy
    @authentification = current_user.authentifications.find(params[:id])
    @authentification.destroy
    flash[:notice] = "La liaison du compte a bien été supprimée."
    redirect_to authentifications_url
  end
end
