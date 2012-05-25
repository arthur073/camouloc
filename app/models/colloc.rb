# -*- encoding : utf-8 -*-
class Colloc < ActiveRecord::Base
	attr_accessible :nom

	has_many :users,:dependent => :destroy

end
