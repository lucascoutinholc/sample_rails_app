source "https://rubygems.org"

ruby "3.3.5"

gem "rails",           "7.1.5"
gem "importmap-rails", "2.0.3"
gem "sassc-rails",     "2.1.2"
gem "sprockets-rails", "3.5.2"
gem "stimulus-rails",  "1.3.4"
gem "turbo-rails",     "2.0.11"
gem 'bcrypt',          "3.1.20"
gem "bootsnap",        "1.18.4", require: false
gem 'bootstrap-sass',  "3.4.1"
gem 'faker',           "3.5.1"
gem "jbuilder",        "2.13.0"
gem "puma",            "6.4.3"
gem "will_paginate",   "4.0.1"
gem "will_paginate-bootstrap", "1.0.2"

group :development, :test do
  gem "debug",         "1.9.2", platforms: %i[ mri windows ]
  gem "sqlite3",       "2.2.0"
end

group :development do
  gem "web-console",   "4.2.1"
end

group :test do
  gem "capybara",                   "3.40.0"
  gem "guard",                      "2.19"
  gem "guard-minitest",             "2.4.6"
  gem "minitest",                   "5.25.1"
  gem "minitest-reporters",         "1.7.1"
  gem "rails-controller-testing",   "1.0.5"
  gem "selenium-webdriver",         "4.26.0"
  gem "webdrivers",                 "5.2.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ windows jruby ]