# -*- encoding : utf-8 -*-
class PasswordResetsController < ApplicationController
	def new
		@titre = "Mot de passe oublié"
	end

	def create
		@user = User.find_by_email(params[:email])
		@user.password = SecureRandom.hex(5) if @user
		@user.save if @user
		UserMailer.password_reset(@user).deliver if @user
		redirect_to root_url
		flash[:success] = t('flash.passRes')
	end

end
