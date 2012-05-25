# -*- encoding : utf-8 -*-
class AddPasswordToUsers < ActiveRecord::Migration
	def self.up
		add_column :users, :encrypted_password, :string
		add_column :users, :colloc_id, :integer
	end

	def self.down
		remove_column :users, :encrypted_password
		remove_column :users, :colloc_id
	end
end
