# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = "camouloc.herokuapp.com"
		mail(:to => user.email, :subject => "Bienvenue sur Camouloc.")
	end

	def password_reset(user)
   	 	@user = user
    		mail :to => user.email, :subject => "Mot de passe réinitialisé."
  	end

	def colocemail(coloc)
   	 	@coloc = coloc
    		mail :to => "arthur.verger@gmail.com", :subject => "Nouvelle Coloc inscrite."
  	end

end
