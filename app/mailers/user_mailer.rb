# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = "mycoloc.herokuapp.com"
		mail(:to => user.email, :subject => "Bienvenue sur MyColoc.")
	end

end
