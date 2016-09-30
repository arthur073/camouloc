source 'https://rubygems.org'
ruby '1.9.3' 

# Gems nécessaires dans tous les environnements
#gem 'rack-cache', '~> 1.2'
gem 'rails', '3.2.3'
gem 'rack', '1.4.1'
#gem "will_paginate", :git => "https://github.com/p7r/will_paginate.git", :branch => "rails3"
#gem 'will_paginate', '>= 3.0.pre'
gem 'will_paginate', '~> 3.0.6'
gem 'i18n', '~> 0.6.0'
gem 'rails-i18n', '~> 3.0.1'
gem 'newrelic_rpm', '~> 3.9.9.275'


gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'squeel', '~> 1.2.2'
gem 'jquery-rails', '~> 2.0.2'
gem 'mail', '~> 2.4.4'
gem 'rspec-rails', '~> 3.1.0'
gem 'faker', '0.3.1'
gem 'rest-client', '~> 1.8'

# authentification avec facebook,...
gem 'faraday', '~> 0.8'
gem 'multi_json', '~> 1.3	'
gem 'oauth2', '~> 1.0'
gem 'omniauth', '~> 1.2'
gem 'omniauth-oauth2', '~> 1.4.0'
gem 'omniauth-facebook', '~> 3.0.0'
gem 'omniauth-google-oauth2', '~> 0.2.8'
gem 'fbgraph', '~> 1.10.1'


# utilisation de pg pour mysql sur heroku
group :production do
	gem 'pg', '~> 0.13.2'
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
gem 'rack-canonical-host', '~> 0.1.0'
