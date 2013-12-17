require 'rubygems'
require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

require 'fanart_api'

FanartApi::Configuration.configure do |config|
  config.api_key = ''
end

class SampleModel
  def get(uri)
    self
  end

  def params(options = {})
    self
  end

  def response
  end
end

RSpec.configure do |config|
end
