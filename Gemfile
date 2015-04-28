source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.2.1'
gem 'unicorn', '~> 4.8.3'                             # Recommended webserver on heroku
gem 'pg', '~> 0.18.1'                                 # Postgresql driver for Ruby
gem 'sass-rails', '~> 5.0.3'                          # SASS adapter for Rails asset pipeline
gem 'uglifier', '~> 2.7.1'                            # Minifies javascript files
gem 'jquery-rails', '~> 4.0.3'                        # jQuery and the jQuery-ujs driver
gem 'jbuilder', '~> 2.2.13'                           # Create JSON structures via a Builder-style DSL: https://github.com/rails/jbuilder
gem 'activeadmin', '~> 1.0.0.pre1'                    # Create Admin side
gem 'active_admin_importable', '~> 1.1.2'             # CSV import for Active Admin
gem 'devise', '~> 3.4.1'                              # Authentification
gem 'bootstrap-sass', '~> 3.3.4.1'                    # Styling prototype
gem 'simple_form', '~> 3.1.0'                         # Makes forms easy
gem 'masonry-rails', '~> 0.2.4'                       # For adaptive design
# gem 'haml', '~> 4.0.6'                                # is a layer on top of HTML or XML that's designed to express the structure of documents
gem 'mail_form', '~> 1.5.1'                           # Send e-mail straight from forms in Rails with I18n, validations, attachments and request information.
# gem 'paperclip', '~> 4.2.1'                           # Easy upload management for ActiveRecord
# gem 'carrierwave'
# gem 'fog'
# gem 'fog-aws'
gem 'aws-sdk', '~> 2'                                 # S3 API
# gem 's3_direct_upload', '~> 0.1.7'                    # direct upload form helper and assets
group :production do
  gem 'rails_12factor', '~> 0.0.3'                    # Helps speed up deploys on heroku
end

group :development do
  gem 'meta_request', '~> 0.3.4'                      # Sends backend meta info to Chrome plugin (requires install of https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US)
  gem 'better_errors'                                 # Better error descriptions in console
  gem 'binding_of_caller'                             # Allows binding.pry in console
  gem 'quiet_assets'                                  # Makes logs less noisy
end

group :development, :test do
  gem 'awesome_print'                                 # Nicely formatted data structures in console, for example "ap User.first"
  gem 'factory_girl_rails', '~> 4.5.0'                # Test data generator -- see spec/factories/factories.rb
  gem 'faker', '~> 1.4.3'                             # Easy way to add fake data: names, email addresses, etc.
  gem 'git-smart', '~> 0.1.10'                        # Allows "git smart-pull" for less merge messes
end

group :test do
  gem 'rspec-rails', '~> 3.2.1'                       # https://www.relishapp.com/rspec/rspec-rails/docs/gettingstarted
  gem 'shoulda-matchers', '~> 2.8.0'                  # Collection of testing matchers extracted from Shoulda
  gem 'capybara', '~> 2.4.4'                          # Acceptance test framework for web applications http://jnicklas.github.com/capybara/
  gem 'database_cleaner', '~> 1.4.1'                  # database_cleaner is not required, but highly recommended
  gem 'selenium-webdriver', '~> 2.45.0'               # https://code.google.com/p/selenium/
  gem 'chromedriver-helper'                           # Easy installation and use of chromedriver, the Chromium project's selenium webdriver adapter.
  gem 'turnip', '~> 1.2.4'                            # Provides the ability to define steps and run Gherkin files from with RSpec
  gem 'capybara-firebug', '~> 2.0.0'                  # Provides a dead-simple way to run scenarios with Firebug enabled under the selenium driver
end
