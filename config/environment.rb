# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MyColoc::Application.initialize!

#enlever depreciation warnings
ActiveSupport::Deprecation.silenced = true

#ajouter captcha
#config.gem 'phuby'
#require 'phuby/init'

