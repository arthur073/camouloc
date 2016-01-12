# -*- encoding : utf-8 -*-
class TroisDepensesController < ApplicationController
   before_filter :require_login
   layout "dashboard"

   def new
      @expense = TroisDepense.new
	  @coloc = Coloc.find(current_user.coloc_id)
	  @roommates = @coloc.users.order(:created_at)
	  @expenses = @coloc.get_expenses
   end

   def destroy
      @troisdepense = TroisDepense.find(params[:id])
      @troisdepense.destroy
      @colocation = Coloc.find(current_user.coloc_id)
      @colocation.ca = @colocation.ca - @troisdepense.montant
      @colocation.save
      flash[:success] = t("main.expensedeleted")
   end
end
