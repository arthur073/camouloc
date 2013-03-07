class Expense < ActiveRecord::Base

   serialize :parties 

   belongs_to :user
   attr_accessible :montant, :nbr_users, :parties, :raison, :auto, :user_id

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

end
