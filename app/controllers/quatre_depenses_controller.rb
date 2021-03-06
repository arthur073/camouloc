# -*- encoding : utf-8 -*-
class QuatreDepensesController < ApplicationController
       before_filter :require_login
	   layout "dashboard"

	   def new
		  @expense = QuatreDepense.new
		  @coloc = Coloc.find(current_user.coloc_id)
		  @roommates = @coloc.users.order(:created_at)
		  @expenses = @coloc.get_expenses
	   end

        def destroy
                @quatredepense = QuatreDepense.find(params[:id])
                @quatredepense.destroy
                @colocation = Coloc.find(current_user.coloc_id)
                @colocation.ca = @colocation.ca - @quatredepense.montant
                @colocation.save
				flash[:success] = t("main.expensedeleted")
        end
end
