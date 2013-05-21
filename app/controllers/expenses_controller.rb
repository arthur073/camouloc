# -*- encoding : utf-8 -*-
class ExpensesController < ApplicationController
   before_filter :require_login
   def new
      @expense = Expense.new
      @titre = "Nouvelle dépense"
      @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)
      @array = Array.new(@colocataires.size)
   end

   def create
      @expense = Expense.new(params[:expense])
      @expense.parties = params[:parties]
      #@expense.nbr_users = @depense.destinataire_part + @depense.destinataire_part2
      @colocataires = User.where(:coloc_id => current_user.coloc_id).order(:created_at)

      if @expense.save
         #Traite un succès d'enregistrement.
         # ajoute la somme dépensée au Chiffre d'Affaires
         @colocation = Coloc.find(current_user.coloc_id)
         @colocation.ca = @colocation.ca + @expense.montant
         @colocation.save
         #envoie le mail de confirmation de la dépense
         if (@colocation.users.where(:mail => 1).size != 0 )
         begin
            DepenseMailer.new_expense_email(@expense).deliver
         rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
            flash[:info] = t('flash.depCreateKO')  + "\n" + e.message
         else
            flash[:success] = t('flash.depCreateOK')
         end
         end 
         redirect_to User.find(@expense.user_id)
   else
      @titre = "Nouvelle dépense"
      render 'new'
   end

end
def index
   @expenses = Expense.all
end

def destroy
   @expense = Expense.find(params[:id])
   @expense.destroy
   flash[:success] = t('flash.depDestroy')
   redirect_to(:back)
end

private
def require_login
   unless current_user
      flash[:notice] = t('flash.reqLogin')
      redirect_to login_path
   end
end

end
