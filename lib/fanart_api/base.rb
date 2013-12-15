require 'httparty'

class FanartApi::Base
  include HTTParty
  base_uri 'http://api.fanart.tv/webservice//'

  def initialize(client)
    @client = client
  end

  def api_key
    @client.api_key
  end
end