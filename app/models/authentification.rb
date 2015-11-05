class Authentification < ActiveRecord::Base
	belongs_to :user
	attr_accessible :provider, :uid, :user_id
	validates :provider, :uid, :presence => true
	
	def self.find_or_create(auth_hash)
	  unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		user = User.new
		user.nom = auth_hash["info"]["name"]
		user.email = auth_hash["info"]["email"]
		user.image = auth_hash["info"]["image"]
		user.save(:validate => false)
		auth = create :user_id => user.id, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	  end
	  auth
	end
end
