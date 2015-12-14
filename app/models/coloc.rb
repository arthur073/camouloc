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
	
	
	def get_tot
		_roommates = self.users.order(:created_at)
		_nbr_users = _roommates.count
		_expenses = self.get_expenses
		
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
			_transaction_amount = [_array_tot_sorted.first.last.to_i.abs, _array_tot_sorted.last.last.to_i.abs].min
			_array_transactions << [User.find(_worst_user).nom, _transaction_amount, User.find(_best_user).nom]
			
			# on remet les champs à zéro
			_array_tot_sorted.first[1] += _transaction_amount
			_array_tot_sorted.last[1] -= _transaction_amount
		end
		
		_array_reimbursement = _array_tot_sorted
		return _array_transactions
	end
	
	def get_expenses_matrix
		_roommates = self.users.order(:created_at)
		_nbr_users = _roommates.count
		_expenses = self.get_expenses
		
		# generating array
		_result_array = []
		(0.._nbr_users+1).each do |r|
			_result_array << Array.new(_nbr_users+2,0)
		end
		
		return _result_array if _expenses.count == 0
		
		# populating array
		_expenses.each do |e|
			# getting cells to increase
			_row = _roommates.map{|r| r.id}.index(e.user_id)
			_row += 1 if _row >= (_nbr_users / 2)
			_lines = []
			if _nbr_users == 2
				_lines << 0 if e.destinataire_part == 1
				_lines << 2 if e.destinataire_part2 == 1
			elsif _nbr_users == 3
				_lines << 0 if e.destinataire_part == 1
				_lines << 1 if e.destinataire_part2 == 1
				_lines << 3 if e.destinataire_part3 == 1
			elsif _nbr_users == 4
				_lines << 0 if e.destinataire_part == 1
				_lines << 1 if e.destinataire_part2 == 1
				_lines << 3 if e.destinataire_part3 == 1			
				_lines << 4 if e.destinataire_part4 == 1			
			elsif _nbr_users > 4
				e.parties.each_with_index do |party,i|
					_lines << _roommates.map{|r| r.id}.index(party.first) if party.last == 1 && (i <= _nbr_users / 2)
					_lines << _roommates.map{|r| r.id}.index(party.first) + 1 if party.last == 1 && (i > _nbr_users / 2)
				end
			end
			
			# increasing cells
			_lines.each do |_line|
				_result_array[_row][_line] += (e.montant / _lines.count)
			end
		end
		
		# setting zero for i == j
		_result_array.each_with_index do |row, i|
			row.map!.with_index { |line, j| (i == j) ? 0 : line }
		end			

		# Adding emptystrokes values
		_result_array[(_nbr_users / 2).to_i][_nbr_users+1] = -1
		_result_array[_nbr_users+1][(_nbr_users / 2).to_i] = -1
		
		return _result_array
	end
	
	def get_names_matrix
		_roommates = self.users.order(:created_at)
		_insert_position_A = (_roommates.count / 2).to_i
		_insert_position_B = _roommates.count + 1
		
		_return_array = _roommates.map{|r| r.nom}
		_return_array.insert(_insert_position_A, "");
		_return_array.insert(_insert_position_B, "");
		
		return _return_array
	end
	
	def get_chord_params(expenses_matrix)
	
		# get respondents
		_respondents_count = 0	
		expenses_matrix.each do |row|
			_respondents_count += row.map {|m| m.to_f }.reduce(:+)
		end		
		_respondents_count = _respondents_count * 1.6
				
		# get empty stroke
		_empty_stroke = (_respondents_count * 0.2).round(0)
		
		# update matrix
		expenses_matrix.each do |row|
			row.map! { |line| (line == -1) ? _empty_stroke : line }
		end			
		
		return [_respondents_count.to_i, _empty_stroke]
	end
end
