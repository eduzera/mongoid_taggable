$: << File.expand_path("../../lib", __FILE__)

require 'database_cleaner'
require 'pry'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.color_enabled = true
end

require 'mongoid'
require 'mongoid_taggable'

Mongoid.load!("spec/mongoid.yml", :test)

