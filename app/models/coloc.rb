# -*- encoding : utf-8 -*-
class Coloc < ActiveRecord::Base
	attr_accessible :nom, :ca, :palm
	has_many :users, :dependent => :destroy
	has_many :messages, :dependent => :destroy
	validates_uniqueness_of :nom
	
	
	def get_expenses
		_roommates = self.users.order(:created_at) 
		_user_number = _roommates.count
		_expenses = []
		if _user_number <= 2
			_expenses = Depense.all(:conditions => {:user_id => [_roommates[0].id, _roommates[1].id]}, :order => "created_at ASC")
		elsif _user_number == 3
			_expenses = TroisDepense.all(:conditions => {:user_id => [_roommates[0].id, _roommates[1].id, _roommates[2].id]}, :order => "created_at ASC")
		elsif _user_number == 4
			_expenses = QuatreDepense.all(:conditions => {:user_id => [_roommates[0].id, _roommates[1].id, _roommates[2].id, _roommates[3].id]}, :order => "created_at ASC")
		elsif _user_number > 4
			_expenses = Expense.find(:all, :conditions => ["user_id IN (?) AND auto = 0", _roommates.map { |c| c.id }])
			_expenses.delete_if {|item| item == [] } 
		end	
		return _expenses
	end

end
