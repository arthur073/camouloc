# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "mycoloc@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = "www.mycoloc.herokuapps.com"
		mail(:to => user.email, :subject => "Bienvenue sur MyColoc.")
	end

end
