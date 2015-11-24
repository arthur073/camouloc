class Depense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :montant, :raison, :user_id, :auto

  # on définit les paramètres du modèle
  validates :montant, :presence     => true
  validates :raison, :presence     => true
  validates :montant, :numericality => {:less_than => 3000}

  def roommates_involved
    coloc = Coloc.find(User.find(self.user_id).coloc_id)
    roommates = coloc.users.order(:created_at)
	#Getting only roommates involved 
	rm_involved = []
	rm_involved.push(roommates[0]) if self.destinataire_part == 1
	rm_involved.push(roommates[1]) if self.destinataire_part2 == 1
	
	r_i = ""
	i = 0
	rm_involved.each do |rm|
		r_i += rm.nom
		r_i += ", " if i < (rm_involved.count -1)
		r_i += " and " if i == (rm_involved.count -1)
		i+=1
	end
	return r_i
  end
end
