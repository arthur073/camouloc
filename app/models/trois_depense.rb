class TroisDepense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :destinataire_part3, :montant, :raison, :user_id, :auto
end
