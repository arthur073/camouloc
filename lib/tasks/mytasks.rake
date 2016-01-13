#encoding: utf-8 

task :delete_unused_colocs => :environment do
   if true#Date.today.day == 1 or Date.today.day == 7 or Date.today.day == 14 or Date.today.day == 21 or Date.today.day == 28
		desc "Desctruction des colocations non utilisées"
		_colocs = Coloc.all
		_nbrcolocs_nouser = 0
		_nbrcolocs_oneuser = 0
		_nbrcolocs_no_expense = 0
		_nbrcolocs_tooold = 0
		
		_colocs.each do |col|
			if (col.users.count == 0)
				# Delete right away
				#col.destroy
				_nbrcolocs_nouser += 1
				next
			end
			if (col.users.count == 1 && col.created_at <= 3.months.ago)
				# Delete after three months
				#col.destroy
				_nbrcolocs_oneuser += 1
				next
			end
			if (col.users.count >= 2 && col.get_expenses.count == 0 && col.created_at <= 6.months.ago)
				# Delete after 6 months
				#col.destroy
				_nbrcolocs_no_expense += 1
				next
			end
			if (col.users.count >= 2 && col.get_expenses.count > 0 && col.get_expenses.last.created_at <= 12.months.ago)
				# Send confirmation email and delete after 12 months
				begin
					#UserMailer.reset_counters_email_batch(col).deliver
				rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, NoMethodError, Errno::ECONNREFUSED => e
					puts "Unable to send email for coloc " + col.id.to_s							
				else
					puts "Email was sent successfully - we can destroy the flatshare"
					#col.destroy
				end
				_nbrcolocs_tooold += 1
				next
			end
		end

		_summary = "Colocs with no user: " + _nbrcolocs_nouser.to_s
		_summary += "\nColocs with 1 user: " + _nbrcolocs_oneuser.to_s
		_summary += "\nColocs with no expense: " + _nbrcolocs_no_expense.to_s
		_summary += "\nColocs with not used for 12 months: " + _nbrcolocs_tooold.to_s
		puts _summary
		
		begin
			UserMailer.deleteunusedcolocsmail(_summary).deliver
		rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e      
			puts 'Your work submitted successfully however there was a problem with email notification. Cause : ' + e.message 
		end
   end
end



task :unused_colocs => :environment do
   desc "Donne le nombre de colocs non utilisees"
   _nbrcolocs_nouser = 0
   _nbrcolocs_tooold = 0
   _nbrcolocs_no_expense = 0
   Coloc.all.each do |col|
      if (col.users.size <= 1)
         _nbrcolocs_nouser += 1
		 next
      end
	  if col.get_expenses.count == 0 && col.created_at <= 10.months.ago
		_nbrcolocs_no_expense += 1	
		next
	  end
	  if (col.get_expenses.count > 0 && col.get_expenses.last.created_at <= 10.months.ago)
		_nbrcolocs_tooold += 1
		puts col.id
		next
	  end
   end
   
   
   puts _nbrcolocs_nouser  
   puts "Colocations avec moins de 1 utilisateur" 
   puts " -- "
   puts _nbrcolocs_no_expense
   puts "Colocations sans dépenses depuis trop longtemps"
   puts _nbrcolocs_tooold
   puts "Colocations trop agees"
end





task :month_auto_depenses => :environment do
   desc "Clone toutes les depenses automatiques"

   if Date.today.day == 1

      @autodep2 = Depense.where(:auto => 1)
      @autodep3 = TroisDepense.where(:auto => 1)
      @autodep4 = QuatreDepense.where(:auto => 1)
      @autodepN = Expense.where(:auto => 1)


      @autodep2.each do |auto2|
         @autoclone = Depense.new
         @autoclone.user_id = auto2.user_id
         @autoclone.montant = auto2.montant
         @autoclone.raison = auto2.raison
         @autoclone.destinataire_part2 = auto2.destinataire_part2
         @autoclone.destinataire_part = auto2.destinataire_part
         @autoclone.nbr_users = auto2.nbr_users
         @autoclone.save
         # recherche de tous les utilisateurs
         @user_source = User.find(@autoclone.user_id)
         @coloc = Coloc.find(@user_source.coloc_id)
         if (@coloc.users.where(:mail => 1).size != 0 )
            DepenseMailer.new_expense_email(@autoclone).deliver
         end 
      end

      @autodep3.each do |auto3|
         @autoclone = TroisDepense.new
         @autoclone.user_id = auto3.user_id
         @autoclone.montant = auto3.montant
         @autoclone.raison = auto3.raison
         @autoclone.destinataire_part3 = auto3.destinataire_part3
         @autoclone.destinataire_part2 = auto3.destinataire_part2
         @autoclone.destinataire_part = auto3.destinataire_part
         @autoclone.nbr_users = auto3.nbr_users
         @autoclone.save
         # recherche de tous les utilisateurs
         @user_source = User.find(@autoclone.user_id)
         @coloc = Coloc.find(@user_source.coloc_id)
         if (@coloc.users.where(:mail => 1).size != 0 )
            DepenseMailer.new_expense_email(@autoclone).deliver
         end 
      end

      @autodep4.each do |auto4|
         @autoclone = QuatreDepense.new
         @autoclone.user_id = auto4.user_id
         @autoclone.montant = auto4.montant
         @autoclone.raison = auto4.raison
         @autoclone.destinataire_part4 = auto4.destinataire_part4
         @autoclone.destinataire_part3 = auto4.destinataire_part3
         @autoclone.destinataire_part2 = auto4.destinataire_part2
         @autoclone.destinataire_part = auto4.destinataire_part
         @autoclone.nbr_users = auto4.nbr_users
         @autoclone.save
         # recherche de tous les utilisateurs
         @user_source = User.find(@autoclone.user_id)
         @coloc = Coloc.find(@user_source.coloc_id)
         if (@coloc.users.where(:mail => 1).size != 0 )
            DepenseMailer.new_expense_email(@autoclone).deliver
         end 
      end


      @autodepN.each do |autoN|
         @autoclone = Expense.new
         @autoclone.user_id = autoN.user_id
         @autoclone.montant = autoN.montant
         @autoclone.raison = autoN.raison
         @autoclone.parties = autoN.parties
         @autoclone.save
         # recherche de tous les utilisateurs
         @user_source = User.find(@autoclone.user_id)
         @coloc = Coloc.find(@user_source.coloc_id)
         if (@coloc.users.where(:mail => 1).size != 0 )
            DepenseMailer.new_expense_email(@autoclone).deliver
         end 

      end

      puts "Depenses mensuelles ajoutees" 
   else 
      puts "Mauvais jour" 
   end 
end