$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler'
require "machinist/mongo_mapper"
require 'rspec'

::MongoMapper.database = "machinist_mongomapper"

::Machinist.configure do |config|
  config.cache_objects = true
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Rspec.configure do |config|
  config.after(:all)   { ::MongoMapper.database.collections.each { |c| c.remove } }
end
