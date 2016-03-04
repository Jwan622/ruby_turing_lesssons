$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dish'
require 'rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.hook_into :webmock
end
