# -*- encoding : utf-8 -*-
class DepenseMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"

	def new_depense_email(depense)
		@depense = depense
		@user_source = User.find(depense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
                @colocataires = @coloc.users.all
                @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

	def new_depense_auto_email(depense)
		@depense = depense
		@user_source = User.find(depense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
                @colocataires = @coloc.users.all
                @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

end
