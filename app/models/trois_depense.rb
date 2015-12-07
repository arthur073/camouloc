class TroisDepense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :destinataire_part3, :montant, :raison, :user_id, :auto

  # on définit les paramètres du modèle
  validates :montant, :presence     => true
  validates :raison, :presence     => true
  validates :montant, :numericality => {:less_than => 3000}
  
  def roommates_involved
    _coloc = Coloc.find(User.find(self.user_id).coloc_id)
    _roommates = _coloc.users.order(:created_at)
	#Getting only roommates involved 
	_roommates_array = []
	_roommates_array.push(_roommates[0]) if self.destinataire_part == 1
	_roommates_array.push(_roommates[1]) if self.destinataire_part2 == 1
	_roommates_array.push(_roommates[2]) if self.destinataire_part3 == 1
	
	_r_i = ""
	_roommates_array.each_with_index do |rm, i|
		_r_i += rm.nom if i == 0
		_r_i += " - " + rm.nom if i != 0
	end
	return _r_i
  end
end
