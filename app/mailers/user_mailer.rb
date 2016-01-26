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
		mail(:to => coloc.users.map(&:email), :subject => t("mailer.countersresetsubject"))
    end
	
	def reset_counters_email_batch(coloc)
		I18n.locale = "fr"
		@coloc = coloc
		_arrayTot = @coloc.get_tot
		@arrayReimbursement = @coloc.get_reimbursement(_arrayTot)
		@url  = "mailto:arthur.verger@gmail.com?subject=Camouloc&body=Hey, I want to remain on Camouloc! Flatshare " + @coloc.nom + " (id: " + @coloc.id.to_s + "). Thanks"
		mail(:to => coloc.users.map(&:email), :bcc => "arthur.verger@gmail.com", :subject => t("mailer.countersresetsubject_batch"))
		#mail(:to => "arthur.verger@gmail.com", :subject => t("mailer.countersresetsubject_batch"))
    end
end
