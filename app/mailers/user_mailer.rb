# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"

	def welcome_email(user)
		@user = user
		@url  = "camouloc.herokuapp.com"
		mail(:to => user.email, :subject => "[CAMOULOC] Bienvenue parmi nous !")
	end

	def password_reset(user)
   	 	@user = user
    		mail :to => user.email, :subject => "[CAMOULOC] Mot de passe réinitialisé."
  	end

	def colocemail(coloc)
   	 	@coloc = coloc
    		mail :to => "arthur.verger@gmail.com", :subject => "[CAMOULOC] Nouvelle Coloc inscrite."
  	end

        def messagemail(message,coloc)
                @coloc = coloc
		@url  = "camouloc.herokuapp.com"
                @message = message
                @dest = coloc.users.where(:mail => 1)
                emails = @dest.collect(&:email).join(",")
                mail(:to => emails,:subject => "[CAMOULOC] Une colocation vous a contacté !")
        end

        def deleteunusedcolocsmail(nbrcoloc)
                mail(:to => "arthur.verger@gmail.com", :subject => "[CAMOULOC] Destruction des colocations inutilisées")
        end
end
