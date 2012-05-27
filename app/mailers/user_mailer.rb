# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "mycoloc@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = "http://localhost:3000/"
		mail(:to => user.email, :subject => "Bienvenue sur MyColoc.")
	end

end
