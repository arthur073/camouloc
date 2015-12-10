# -*- encoding : utf-8 -*-
class ExpensesController < ApplicationController
	before_filter :require_login
	layout "dashboard"

	def new
		@expense = QuatreDepense.new
		@coloc = Coloc.find(current_user.coloc_id)
		@roommates = @coloc.users.order(:created_at)
		@expenses = @coloc.get_expenses
	end

	def destroy
	   @expense = Expense.find(params[:id])
	   @expense.destroy
	   @colocation = Coloc.find(current_user.coloc_id)
	   @colocation.ca = @colocation.ca - @expense.montant
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
