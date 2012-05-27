# -*- encoding : utf-8 -*-
class DepenseMailer < ActionMailer::Base
	default from: "mycoloc@gmail.com"

	def new_depense_email(depense)
		@depense = depense
		@user_dest = User.find(depense.destinataire_id)
		@user_source = User.find(depense.user_id)
		@coloc = Coloc.find(@user_dest.coloc_id)
		mail(:to => @coloc.users.all.map(&:email), :subject => "MyColoc, nouvelle dépense.")
	end

end
