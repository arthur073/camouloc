# -*- encoding : utf-8 -*-
module SessionsHelper

	def sign_in(user)
		sign_out if signed_in?
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_remember_token
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		@current_user = nil
	end

	def require_login
		redirect_to login_path, :notice => "Please login before accessing to this webpage." unless signed_in?
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		clear_return_to
	end

	def current_user?(user)
		user == current_user
	end

	private

	def user_from_remember_token
		User.authenticate_with_salt(*remember_token)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end

	def clear_return_to
		session[:return_to] = nil
	end
end
