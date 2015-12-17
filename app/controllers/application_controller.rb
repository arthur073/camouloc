# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

	protect_from_forgery
	include SessionsHelper

	#before_filter :prepare_for_mobile
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

	def not_found
		# Rescuing error 404
		flash[:error] = "Warning: the page you are looking for doesn't exist"
		redirect_to root_url unless signed_in?
		redirect_to Coloc.find(current_user.coloc_id) if signed_in?
	end	
	
	private

	def set_user_language
		I18n.locale = 'fr'
	end
end
