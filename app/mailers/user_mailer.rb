# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "no-reply@camouloc.fr"
    default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@camouloc.fr"

	def progress_email(user)
		@firstname = user.nom.split(" ")[0]
		secret = Coloc.find(user.coloc_id).secret
		url_end = url_for create_users_path(:user => user, :secret => secret)
		url_start = url_for root_url
		@url = url_start + url_end[1..-1]
		mail(:to => user.email, :subject => "[CAMOULOC] Welcome aboard! Your account is almost ready")
	end
	
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
