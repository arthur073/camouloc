class Depense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_part, :destinataire_part2, :montant, :raison, :user_id, :auto
end
