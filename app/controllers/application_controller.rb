# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

	protect_from_forgery
	include SessionsHelper

	before_filter :prepare_for_mobile
	before_filter :set_user_language
	before_filter :set_locale

	def mobile_device?
		request.user_agent =~ /Mobile/ 
	end
	helper_method :mobile_device?

	def prepare_for_mobile
		request.format = :mobile if mobile_device?
	end

	def set_locale
		if params[:locale].blank?
			I18n.locale = 'fr'
		else
			I18n.locale = params[:locale]
		end
	end   

	# ensure locale persists
	def default_url_options(options={})
		{:locale => I18n.locale}
	end

	private

	def set_user_language
		I18n.locale = 'fr'
	end

end
