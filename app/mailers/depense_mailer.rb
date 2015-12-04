# -*- encoding : utf-8 -*-
class DepenseMailer < ActionMailer::Base
	default from: "no-reply@camouloc.fr"
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

   def new_expense_email(_expense)
		_user = User.find(_expense.user_id)
		_coloc = Coloc.find(_user.coloc_id)
		@firstame = _user.nom
		@flatsharename = _coloc.nom
		@amount = _expense.montant
		@reason = _expense.raison.capitalize
		@roommates_involved = _expense.roommates_involved
		@expensedate = _expense.created_at.strftime('%b %e')
		mail(:to => _coloc.users.where(:mail => 1).map(&:email), :subject => "[CAMOULOC] Nouvelle dépense")
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
