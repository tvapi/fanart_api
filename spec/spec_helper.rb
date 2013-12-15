require 'rubygems'
require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

require 'fanart_api'

FanartApi::Configuration.configure do |config|
  config.api_key = ''
end

RSpec.configure do |config|
end
