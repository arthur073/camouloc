# -*- encoding : utf-8 -*-
class TroisDepensesController < ApplicationController
   before_filter :require_login
   layout "dashboard"

   def new
	  @roommates = Coloc.find(current_user.coloc_id).users.order(:created_at)  
	  user_number = @roommates.count
	  @expenses = []
	  if user_number <= 2
		  @expenses = Depense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id]}, :order => "created_at ASC")
	  elsif user_number == 3
  		  @expenses = TroisDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id]}, :order => "created_at ASC")
	  elsif user_number == 4
		  @expenses = QuatreDepense.all(:conditions => {:user_id => [@roommates[0].id, @roommates[1].id, @roommates[2].id, @roommates[3].id]}, :order => "created_at ASC")
	  elsif user_number > 4
		  @expenses = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", @roommates.map { |c| c.id }])
		  @expenses.delete_if {|item| item == [] or item.auto == 1 } 
	  end
	  
      @troisdepense = TroisDepense.new
      @titre = "Nouvelle dépense"
      @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
   end

   def create
      @troisdepense = TroisDepense.new(params[:trois_depense])
      @troisdepense.nbr_users = @troisdepense.destinataire_part + @troisdepense.destinataire_part2 + @troisdepense.destinataire_part3
      @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
      if @troisdepense.save
         # Ajoute la somme dépensée au Chiffre d'Affaires
         @colocation = Coloc.find(current_user.coloc_id)
         @colocation.ca = @colocation.ca + @troisdepense.montant
         @colocation.save
         #envoie le mail de confirmation de la dépense
         # recherche de tous les utilisateurs
         if (@colocation.users.where(:mail => 1).size != 0 )
            begin
               DepenseMailer.new_depense_email(@troisdepense).deliver
            rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
               flash[:info] = t('flash.depCreateKO') + "\n" + e.message
            else
               flash[:success] = t('flash.depCreateOK')
            end
         end 
         redirect_to @troisdepense
      else
         @titre = "Nouvelle dépense"
         render 'new'
      end
   end

   def destroy
      @troisdepense = TroisDepense.find(params[:id])
      @troisdepense.destroy
      @colocation = Coloc.find(current_user.coloc_id)
      @colocation.ca = @colocation.ca - @troisdepense.montant
      @colocation.save
      flash[:success] = "This expense has been successfully deleted"
   end
   
   private
   def require_login
      unless current_user
         flash[:notice] = t('flash.reqLogin')
         redirect_to login_path
      end
   end

end
