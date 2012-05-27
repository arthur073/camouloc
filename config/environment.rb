# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MyColoc::Application.initialize!


	#permet d'envoyer des mails
	ActionMailer::Base.smtp_settings = {   :address => "smtp.gmail.com",   :port => 25,   :user_name => "arthur.verger@gmail.com",   :password => "3.141592",   :authentication => :plain }



