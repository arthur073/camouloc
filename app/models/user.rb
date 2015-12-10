# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
	belongs_to :coloc
	has_many :expenses, :dependent => :destroy
	has_many :depenses, :dependent => :destroy
	has_many :trois_depenses, :dependent => :destroy
	has_many :quatre_depenses, :dependent => :destroy
	has_many :authentifications, :dependent => :destroy
	attr_accessor :password
	attr_accessible :nom, :email, :password, :password_confirmation, :coloc_id, :mail, :image, :tot

	
	validates_uniqueness_of :email
	# Crée automatique l'attribut virtuel 'password_confirmation'.
	validates :password, :presence     => true,
		:confirmation => true,
		:length       => { :within => 6..40 }

	before_save :encrypt_password

	def has_image
		if self.image != "no" 
			return true
		else 
			return false
		end
	end
	
	# Retour true (vrai) si le mot de passe correspond.
	def has_password?(password_soumis)
		# Compare encrypted_password avec la version cryptée de
		# password_soumis.
		encrypted_password == encrypt(password_soumis)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
	
	def add_provider(auth_hash)
	  # Check if the provider already exists, so we don't add it twice
	  unless self.authentifications.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		Authentification.create :user_id => self.id, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	  end
	end
	
	def set_image
		first_letter = self.nom[0].downcase
		if first_letter =~ /[[:alpha:]]/
			self.image = "avatar-" + first_letter + ".png"
		else
			self.image = "avatar-a.png"
		end
	end

	def color
		relative_id = Coloc.find(self.coloc_id).users.index(self)
		case relative_id % 6 
		when 0    
		  return ["blue1","#8DC3E3"]
		when 1    
		  return ["blue2","#5EA5CF"]
		when 2    
		  return ["blue3","#3C8CBC"]
		when 3    
		  return ["blue4","#1E77AB"]
		when 4    
		  return ["blue5","#085B8C"]
		when 5   
		  return ["blue6","#054972"]
		else
		  return ["default","gray"]
		end
	end
	
	def tot_html(user_tot)
		_ending_html = "<span class='pull-right text-green'><i class='fa fa-angle-up'></i> " + ActionController::Base.helpers.number_to_currency(user_tot, precision: 2) + "</span>" if user_tot >= 0
		_ending_html = "<span class='pull-right text-red'><i class='fa fa-angle-down'></i> " + ActionController::Base.helpers.number_to_currency(user_tot, precision: 2) + "</span>" if user_tot < 0
		return self.nom + _ending_html
	end
	
	def get_tot_for_chart(array_tot)
		return array_tot[self.id]["spent"]
	end
	
	private

	def encrypt_password
		self.encrypted_password = encrypt(password) if password.present?
	end

	def encrypt(string)
		string # Implémentation provisoire 
	end
end
