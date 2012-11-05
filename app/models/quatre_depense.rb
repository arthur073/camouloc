class QuatreDepense < ActiveRecord::Base
        belongs_to :user
        attr_accessible :destinataire_part, :destinataire_part2, :destinataire_part3, :destinataire_part4, :montant, :raison, :user_id, :auto

	# on définit les paramètres du modèle
	validates :montant, :presence     => true
end
