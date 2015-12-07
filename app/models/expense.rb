class Expense < ActiveRecord::Base

   serialize :parties 

   belongs_to :user
   attr_accessible :montant, :nbr_users, :parties, :raison, :auto, :user_id, :roommates_involved

   # on définit les paramètres du modèle
   validates :montant, :presence     => true
   validates :raison, :presence     => true
   validates :montant, :numericality => {:less_than => 3000}


   def nbr_users
      @nbr = 0
      self.parties.each do |elem|
         @nbr = @nbr + elem.last.to_i 
      end
      return @nbr
   end
   
   def roommates_involved
      _roommates_array = []
      self.parties.each do |party|
        _roommates_array << User.find(party.first).nom if party.last.to_i == 1
      end
	  _r_i = ""
	  _roommates_array.each_with_index do |roommate,i|
		_r_i += roommate if i == 0
		_r_i += " - " + roommate if i != 0
	  end
      return _r_i
   end

end
