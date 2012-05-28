source 'https://rubygems.org'

# Gems nécessaires dans tous les environnements
gem 'rails', '3.2.3'
gem "will_paginate", :git => "https://github.com/p7r/will_paginate.git", :branch => "rails3"
gem 'gravatar_image_tag', '1.0.0.pre2'
gem "squeel"  # Last officially released gem
gem 'jquery-rails'
gem "mail"
gem 'rspec-rails', '2.5.0'
gem 'faker', '0.3.1'

# utilisation de pg pour mysql
group :production, :test do
	gem 'pg'
end
group :development do
	gem 'sqlite3', '1.3.6', :require => 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end



# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platform => :ruby

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
#gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
