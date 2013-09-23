source 'https://rubygems.org'

# web application frameworks
gem 'rails', '3.2.14'

#?
gem 'inherited_resources'

# web server
gem 'thin'

# database drivers
gem 'sqlite3'
gem 'pg'

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

group :development do
  # ERD tool                
  gem 'rails-erd'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'rails_best_practices'
end

group :test do
  # Main testing framework
  gem 'rspec'
  gem 'rspec-rails'

  # Helpers for testing views/controllers
  gem 'capybara', '2.0.2'

  # Factories for generating example data
  gem 'factory_girl_rails'

  # Percentage loader for tests
  gem 'fuubar'

  # Code Coverage analysis
  gem 'simplecov'

  # PhantomJS
  gem 'poltergeist'

  # Allows to clean database on each test
  gem 'database_cleaner'
end

group :development, :test do
  # Rails accelerator
  gem 'zeus'

  # Debugging utils
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'
  gem 'awesome_print' 

  # Environment automatization
  gem 'guard'

  # Guard plugins
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-zeus'
  gem 'guard-livereload'
  

  # Guard notifiers
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