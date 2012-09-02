# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
	def home
		@titre = "Camouloc"
	end

	def contact
		@titre = "Contact"
	end

	def about
		@titre = "A propos"
	end

	def changelog
		@titre = "Changelog"
	end

end
