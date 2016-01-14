# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

	protect_from_forgery
	include SessionsHelper

	before_filter :set_locale

	def mobile_device?
		request.user_agent =~ /Mobile/ 
	end
	helper_method :mobile_device?

	def prepare_for_mobile
		request.format = :mobile if mobile_device?
	end

	def set_locale
		if params[:locale].blank? or (!params[:locale].eql? "fr" and !params[:locale].eql? "en")
			I18n.locale = extract_locale_from_accept_language_header
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
		flash[:error] = t("main.error404")
		redirect_to root_url unless signed_in?
		redirect_to Coloc.find(current_user.coloc_id) if signed_in?
	end	
	
	private
	  def extract_locale_from_accept_language_header
		puts "HERE"
		puts request.env['HTTP_ACCEPT_LANGUAGE']
		request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	  end
end
