# -*- encoding : utf-8 -*-
class AuthentificationsController < ApplicationController
  def index
    @authentifications = current_user.authentifications if current_user
    @faceb_url = "http://camouloc.herokuapp.com/auth/facebook"
  end
  
  def create
    auth = request.env["omniauth.auth"] 
	if signed_in? 
		current_user.authentifications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
		# on pose un message sur facebook
		@authent = Authentification.where(:user_id => current_user.id, :provider => auth['provider'], :uid => auth['uid'])
		@token = auth['credentials']['token']
		@authent.publish('Pour ta Coloc, quoi de mieux que Camouloc ?! Gratuite, pratique et rapide, cette application gère mes comptes à merveille, alors pourquoi pas les tiens ? Viens plutôt jeter un coup d\'oeil !', @token)
		# on met à jour le nom et le prénom et la photo de profil
		@newFirstName = auth['info']['first_name']
		@newLastName = auth['info']['last_name']
		@image_url = auth['info']['image']
		@image_url["square"] = "large"
		@user = User.find(current_user.id)
		@user.update_attribute( :nom, "#{@newFirstName.titleize} #{@newLastName[0].titleize}")
		@user.update_attribute( :image, @image_url)
		flash[:success] = t('flash.authCreate1') +   "#{auth['provider']}. "+ t('flash.authCreate2')
		redirect_to @user
	else 
		# l'utilisateur n'est pas connecté, on essaie de le logger
		@authent = Authentification.where(:uid=>auth['uid'], :provider=>auth['provider'])
		User.all.each do |users|
			@auth = users.authentifications
			@auth.each do |authe| 
				if authe.uid == auth['uid'] && authe.provider == auth['provider'] 
					@user = users
				end
			end
		end

		if @user != nil
			sign_in @user
			redirect_to @user
		else 
			# l'utilisateur n'est pas connecté et n'a jamais paramétré de compte Facebook
			@inscr = env["omniauth.params"]['inscr']
			@colocId = env["omniauth.params"]['colocId']
			if @inscr == '1' 
				# soit c'est une demande d'inscription : 
				@user = User.new
				@user.save(:validates => false)
				@newFirstName = auth['info']['first_name']
				@newLastName = auth['info']['last_name']
				@image_url = auth['info']['image']
				@email = auth['info']['email']
				@user.update_attribute(:nom, "#{@newFirstName.titleize} #{@newLastName[0].titleize}")
				@user.update_attribute( :image, @image_url)
				@user.update_attribute( :email, @email)
				@user.update_attribute( :coloc_id, @colocId)
				@user.authentifications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
				# une fois l'utilisateur créé, on poste un message sur Facebook
				@authent = Authentification.where(:user_id => @user.id, :provider => auth['provider'], :uid => auth['uid'])
				@token = auth['credentials']['token']
				@authent.publish('Pour ta Coloc, quoi de mieux que Camouloc ?! Gratuite, pratique et rapide, cette application gère mes comptes à merveille, alors pourquoi pas les tiens ? Viens plutôt jeter un coup d\'oeil !', @token)
				flash[:success] = t('flash.authCompte')
				sign_in @user
				redirect_to Coloc.find(@colocId)
			else
				# soit c'est une erreur 
				flash[:error] = t('flash.authKO') 
				redirect_to login_path
			end 
		end
	end
  end
  
  def destroy
    @authentification = current_user.authentifications.find(params[:id])
    @authentification.destroy
    flash[:notice] = t('flash.authDestroy')
    redirect_to authentifications_url
  end
end
