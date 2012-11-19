class Authentification < ActiveRecord::Base
	belongs_to :user
	attr_accessible :user_id

	def self.publish(text, token)
		begin 
			@user = FbGraph::User.me(token).fetch
			@user.feed!(:message => text, :link => 'http://camouloc.fr.cr', :name => 'Camouloc', :description => 'Une application gratuite de gestion de Colocation' )
		rescue Exception => e
		end
	end
end
