class TroisDepense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :destinataire_part3, :montant, :raison, :user_id, :auto

  # on définit les paramètres du modèle
  validates :montant, :presence     => true
  validates :raison, :presence     => true
  validates :montant, :numericality => {:less_than => 3000}
end
