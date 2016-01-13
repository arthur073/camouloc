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
			_expenses = Expense.find(:all, :conditions => ["user_id IN (?)", _roommates.map { |c| c.id }]).sort_by(&:created_at)
			_expenses.delete_if {|item| item == [] } 
		end	
		return _expenses
	end
	
	
	def get_tot
		_roommates = self.users.order(:created_at)
		_nbr_users = _roommates.count
		_expenses = self.get_expenses
		 puts "ROOMMATES NUMBER"
		 puts _nbr_users
		
		# Init return value
		_array_tot = {}
		_roommates.each do |r| 
			_array_tot[r.id] = {"tot" => 0, "spent" => 0}
		end
		
		_expenses.each do |e| 
			# on ajoute pour la source
			_array_tot[e.user_id]["tot"] += e.montant
			_array_tot[e.user_id]["spent"] += e.montant
			# on retire pour les autres
			if _nbr_users == 2
				_array_tot[_roommates[0].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part == 1
				_array_tot[_roommates[1].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part2 == 1
			elsif _nbr_users == 3
				_array_tot[_roommates[0].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part == 1
				_array_tot[_roommates[1].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part2 == 1			
				_array_tot[_roommates[2].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part3 == 1 
			elsif _nbr_users == 4
				_array_tot[_roommates[0].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part == 1
				_array_tot[_roommates[1].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part2 == 1			
				_array_tot[_roommates[2].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part3 == 1 
				_array_tot[_roommates[4].id]["tot"] -= e.montant / e.nbr_users if e.destinataire_part4 == 1 
			elsif _nbr_users > 4
				 puts "PARTIES"
				 puts e.parties
				 e.parties.each do |p|
					_array_tot[p.first.to_i]["tot"] -= e.montant / e.nbr_users if p.last == 1
				 end			
			end			
		end	
		return _array_tot
	end
	
	def get_reimbursement(array_tot)
		_nbr_users = self.users.count
		_array_tot_sorted = []
		_array_transactions = []
		
		# passing variable by value
		_array_tot_mod = []
		array_tot.each do |elem|
			_array_tot_mod << [elem.first, elem.last["tot"]]
		end
		
		(0.._nbr_users-1).each do |i|
			# Sorting array_to by tot
			_array_tot_sorted = _array_tot_mod.sort_by {|e| e.last}.delete_if{|e| e.last == 0}
			# exiting if array is equal to zero (early solution)
			break if _array_tot_sorted == []
			
			_worst_user = _array_tot_sorted.first.first
			_best_user = _array_tot_sorted.last.first
			_transaction_amount = [_array_tot_sorted.first.last.round(2).abs, _array_tot_sorted.last.last.round(2).abs].min
			_array_transactions << [User.find(_worst_user).nom, _transaction_amount, User.find(_best_user).nom]
			
			# on remet les champs à zéro
			_array_tot_sorted.first[1] += _transaction_amount
			_array_tot_sorted.last[1] -= _transaction_amount
		end
		
		_array_reimbursement = _array_tot_sorted
		return _array_transactions.delete_if{|elem| elem[1] == 0}
	end
	
	def get_expenses_matrix
		_roommates = self.users.order(:created_at)
		_nbr_users = _roommates.count
		_expenses = self.get_expenses
		
		# generating array
		_result_array = []
		(0.._nbr_users-1).each do |r|
			_result_array << Array.new(_nbr_users,0)
		end
		
		# avoids exceptions
		return _result_array if _expenses.count == 0
		
		# populating array
		_expenses.each do |e|
			# getting cells to increase
			_row = _roommates.map{|r| r.id}.index(e.user_id)
			_lines = []
			if _nbr_users == 2
				_lines << 0 if e.destinataire_part == 1
				_lines << 1 if e.destinataire_part2 == 1
			elsif _nbr_users == 3
				_lines << 0 if e.destinataire_part == 1
				_lines << 1 if e.destinataire_part2 == 1
				_lines << 2 if e.destinataire_part3 == 1
			elsif _nbr_users == 4
				_lines << 0 if e.destinataire_part == 1
				_lines << 1 if e.destinataire_part2 == 1
				_lines << 2 if e.destinataire_part3 == 1			
				_lines << 3 if e.destinataire_part4 == 1			
			elsif _nbr_users > 4
				e.parties.each_with_index do |party,i|
					_lines << _roommates.map{|r| r.id}.index(party.first) if party.last == 1
				end
			end
			
			# increasing cells
			_lines.each do |_line|
				_result_array[_row][_line] += (e.montant / _lines.count).round(0)
			end
		end
				
		return _result_array
	end
	
	def get_names_matrix
		_roommates = self.users.order(:created_at)
		_return_array = _roommates.map{|r| r.nom}
		return _return_array
	end
	
	def get_chord_params(expenses_matrix)
		# get array sum
		_respondents_count = 0	
		expenses_matrix.each do |row|
			_respondents_count += row.map {|m| m.to_f }.reduce(:+)
		end				
		return _respondents_count.to_i
	end
	
	def get_lineChart_params(expenses)
		_relevant_expenses_count = expenses.last(50).count
		_relevant_expenses = expenses.last(50).sort_by{|e| e[:created_at]}.group_by{|e| e.created_at.beginning_of_month}
		
		_expenses_dates = _relevant_expenses.map{|elem| I18n.l(elem.last[0].created_at, :format => :short).titleize}
		_expenses_values = _relevant_expenses.map{|elem| elem.last.inject(0){|sum,e| sum += e.montant }}
	
		return [_expenses_dates, _expenses_values, _relevant_expenses_count]
	end
end
