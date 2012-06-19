# -*- encoding : utf-8 -*-
class Coloc < ActiveRecord::Base
	attr_accessible :nom, :ca

	has_many :users, :dependent => :destroy

	validates_uniqueness_of :nom

end
