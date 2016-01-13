# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
	default from: "Camouloc@noreply-camouloc.fr"
    default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@camouloc.fr"

	def progress_email(user)
		@firstname = user.nom.split(" ")[0]
		secret = Coloc.find(user.coloc_id).secret
		url_end = url_for create_users_path(:user => user, :secret => secret)
		url_start = url_for root_url
		@url = url_start + url_end[1..-1]
		mail(:to => user.email, :subject => t("mailer.welcomeaboardsubject"))
	end
	
	def welcome_email(user, roommate)
		@user = user
		@firstname = user.nom.split(" ")[0]
		@roommate = roommate
		@flatshare_name = Coloc.find(user.coloc_id).nom
		@url  = root_url
		mail(:to => user.email, :subject => t("mailer.invitationsubject"))
	end

	def password_reset(user)
   	 	@user = user
		@firstname = user.nom.split(" ")[0]
		@flatshare_name = Coloc.find(user.coloc_id).nom
		@url  = root_url
		mail :to => user.email, :subject => t("mailer.passwordresetsubject")
  	end

	def colocemail(coloc)
   	 	@coloc = coloc
		mail :to => "arthur.verger@gmail.com", :subject => "[CAMOULOC] Nouvelle Coloc inscrite."
  	end


    def deleteunusedcolocsmail(_summary)
		@summary = _summary
		mail(:to => "arthur.verger@gmail.com", :subject => "[CAMOULOC] Destruction des colocations inutilisées")
    end
	
    def reset_counters_email(coloc)
		@coloc = coloc
		_arrayTot = @coloc.get_tot
		@arrayReimbursement = @coloc.get_reimbursement(_arrayTot)
		@url  = root_url
		mail(:to => coloc.users.where(:mail => 1).map(&:email), :subject => t("mailer.countersresetsubject"))
    end
end
