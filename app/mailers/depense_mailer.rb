# -*- encoding : utf-8 -*-
class DepenseMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"

	def new_depense_email(depense)
		@depense = depense
		@user_source = User.find(depense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
                @colocataires = @coloc.users.all
                @nbrcoloc = @colocataires.size
		mail(:to => @coloc.users.all.map(&:email), :subject => "MyColoc, nouvelle dépense.")
	end

end
