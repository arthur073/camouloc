class Depense < ActiveRecord::Base
  belongs_to :user
  attr_accessible :destinataire_id, :montant, :raison, :source_id
end
