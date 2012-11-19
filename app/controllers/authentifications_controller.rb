# -*- encoding : utf-8 -*-
class AuthentificationsController < ApplicationController
  def index
    @authentifications = current_user.authentifications if current_user
  end
  
  def create
    auth = request.env["omniauth.auth"] 
	if signed_in? 
		current_user.authentifications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
		redirect_to authentifications_url
		# on pose un message sur facebook
		@authent = Authentification.where(:user_id => current_user.id, :provider => auth['provider'], :uid => auth['uid'])
		@token = auth['credentials']['token']
		@authent.publish('Pour ma Coloc, j\'utilise Camouloc ! Une application gratuite créee par des étudiants pour les étudiants. Venez jeter un coup d\'oeil !', @token)
		# on met à jour le nom et le prénom et la photo de profil
		@newFirstName = auth['info']['first_name']
		@newLastName = auth['info']['last_name']
		@image_url = auth['info']['image']
		@image_url["square"] = "large"
		@user = User.find(current_user.id)
		@user.update_attribute( :nom, "#{@newFirstName.titleize} #{@newLastName[0].titleize}")
		@user.update_attribute( :image, @image_url)
		flash[:notice] = "Nous avons correctement lié votre profil #{auth['provider']}. Vos informations ont été mises à jour."
		flash[:notice] = "#{@image_url}"
	else 
		# l'utilisateur n'est pas connecté, on essaie de le logger
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
			# l'utilisateur n'est pas connecté,
			# l'utilisateur n'a jamais paramétré de compte Facebook
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
