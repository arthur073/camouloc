# -*- encoding : utf-8 -*-
class PasswordResetsController < ApplicationController
	layout 'login'

	def new
	end

	def create
		@user = User.find_by_email(params[:email])

		if @user
			@user.password = SecureRandom.hex(5) 
			@user.save 
			UserMailer.password_reset(@user).deliver 
			redirect_to login_path
			flash[:success] = "Your password has been reset and sent to your email address: " + @user.email
		else
			flash[:error] = "No user found with this email"
			redirect_to new_password_reset_path
		end
	end

end
