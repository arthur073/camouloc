# -*- encoding : utf-8 -*-
class DepenseMailer < ActionMailer::Base
	default from: "contact.mycoloc@gmail.com"
    default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@camouloc.fr"

	def new_depense_email(depense)
		@depense = depense
		@user_source = User.find(depense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
                @colocataires = @coloc.users.order(:created_at)
                @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

   def new_expense_email(expense)
      @depense = expense
		@user_source = User.find(expense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
      @colocataires = @coloc.users.order(:created_at)
      @colocatairesTmp = @colocataires.reverse!
      @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

	def new_depense_auto_email(depense)
		@depense = depense
		@user_source = User.find(@depense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
                @colocataires = @coloc.users.order(:created_at)
                @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

   def new_expense_auto_email(expense)
      @depense = expense
		@user_source = User.find(expense.user_id)
		@coloc = Coloc.find(@user_source.coloc_id)
      @colocataires = @coloc.users.order(:created_at)
      @colocatairesTmp = @colocataires.reverse!
      @nbrcoloc = @colocataires.size
		@url  = "camouloc.herokuapp.com"
		mail(:to => @coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
	end

end
