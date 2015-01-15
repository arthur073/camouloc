source 'https://rubygems.org'

# Gems nécessaires dans tous les environnements
gem 'rails', '3.2.3'
#gem "will_paginate", :git => "https://github.com/p7r/will_paginate.git", :branch => "rails3"
#gem 'will_paginate', '>= 3.0.pre'
gem 'will_paginate', '~> 3.0.6'
gem 'rails-i18n', '~> 3.0.1'
gem 'newrelic_rpm', '~> 3.9.9.275'


gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'squeel', '~> 1.2.2'
gem 'jquery-rails', '~> 2.0.2'
gem 'mail', '~> 2.4.4'
gem 'rspec-rails', '~> 3.1.0'
gem 'faker', '0.3.1'

# authentification avec facebook,...
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-facebook', '~> 2.0.0'
gem 'fbgraph', '~> 1.10.1'


# utilisation de pg pour mysql sur heroku
group :production do
	gem 'pg', '~> 0.18.1'
end
group :development, :test do
	gem 'sqlite3', '1.3.6', :require => 'sqlite3'
	gem 'webrat', '~> 0.7.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end

gem 'jqcloud-rails', '~> 1.0.0'


#options pas défaut :

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
