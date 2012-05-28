# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
	belongs_to :coloc
	has_many :depenses, :dependent => :destroy
	attr_accessor :password
	attr_accessible :nom, :email, :password, :password_confirmation, :coloc_id


	validates_uniqueness_of :email
	# Crée automatique l'attribut virtuel 'password_confirmation'.
	validates :password, :presence     => true,
		:confirmation => true,
		:length       => { :within => 6..40 }

	before_save :encrypt_password

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

	private

	def encrypt_password
		self.encrypted_password = encrypt(password) if password.present?
	end

	def encrypt(string)
		string # Implémentation provisoire 
	end
end
