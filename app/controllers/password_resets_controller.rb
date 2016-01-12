# -*- encoding : utf-8 -*-
class PasswordResetsController < ApplicationController
	layout 'login'

	def new
	end

	def create
		@user = User.find_by_email(params[:email])

		if @user
			@user.password = SecureRandom.hex(4) 
			@user.save 
			UserMailer.password_reset(@user).deliver 
			redirect_to login_path
			flash[:success] = t("main.passwordresetsuccess", :email => @user.email)
		else
			flash[:error] = t("main.passwordresetfailure")
			redirect_to new_password_reset_path
		end
	end

end
