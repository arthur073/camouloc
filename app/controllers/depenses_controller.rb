# -*- encoding : utf-8 -*-
class DepensesController < ApplicationController
   before_filter :require_login
   layout "dashboard"


   def new
      @expense = Depense.new
	  @coloc = Coloc.find(current_user.coloc_id)
	  @roommates = @coloc.users.order(:created_at)
	  @expenses = @coloc.get_expenses
   end

   def destroy
      @depense = Depense.find(params[:id])
      @depense.destroy
      @colocation = Coloc.find(current_user.coloc_id)
      @colocation.ca = @colocation.ca - @depense.montant
      @colocation.save
      flash[:success] = "This expense has been successfully deleted"
   end
end
