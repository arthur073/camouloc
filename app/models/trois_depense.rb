class TroisDepense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :destinataire_part3, :montant, :raison, :user_id, :auto

  # on définit les paramètres du modèle
  validates :montant, :presence     => true
  validates :raison, :presence     => true
  validates :montant, :numericality => {:less_than => 3000}
  
  def roommates_involved
    coloc = Coloc.find(User.find(self.user_id).coloc_id)
    roommates = coloc.users.order(:created_at)
    r_i = ""
    r_i += roommates[0].nom + ", " if self.destinataire_part == 1
    r_i += roommates[1].nom + " and " if self.destinataire_part2 == 1
    r_i += roommates[2].nom if self.destinataire_part3 == 1
  end
  
end
