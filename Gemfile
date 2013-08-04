source 'https://rubygems.org'

# web application frameworks
gem 'rails', '3.2.14'

# web server
gem 'thin'

# database drivers
gem 'sqlite3'

# authentication
gem 'devise'
gem 'cancan'

gem "hobo_fields"

# process declaration
gem 'foreman'        

# js-libraries
gem 'jquery-rails'

# deployment
gem 'capistrano'                   
gem 'rvm-capistrano'
gem 'capistrano-multiconfig'

# image management
gem 'mini_magick'
gem 'carrierwave'

# form builders
gem 'formtastic'
gem 'formtastic-bootstrap'
gem 'cocoon'

#ui
gem "therubyracer"
gem "less-rails" 
gem "twitter-bootstrap-rails"

# search and pagination
gem 'ransack'          
gem 'kaminari'       
gem 'zeus'   

group :development, :test do
	# ERD tool
  gem 'rails-erd'                   

	# Testing utils
  gem 'factory_girl_rails'
  gem 'capybara', '2.0.2'
  gem 'rspec'
  gem 'fuubar'
  gem 'database_cleaner'
  gem "parallel_tests"

  # Debugging utils
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'
  gem 'awesome_print'                
  # gem 'better_errors'
  # gem 'binding_of_caller'

  # Testing automatization
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-zeus'
  gem 'guard-livereload'
  
  gem 'rspec-rails'
  gem 'simplecov'

  gem 'rails_best_practices'
  
  gem 'terminal-notifier-guard' 
  gem 'libnotify' unless `uname`.match "Darwin"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# 

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
