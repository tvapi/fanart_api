# documentation: http://fanart.tv/api-docs/tv-api
class FanartApi::Tv < FanartApi::Base
  def find(id, type = 'all', sort = '1', limit = '2')
    get("series/#{shared_uri}").params(id: id, type: type, sort: sort, limit: limit).response
  end

  def update(timestamp = (Time.now - 172800).to_i)
    get('newtv/{api_key}/{timestamp}').params(timestamp: timestamp).response
  end
end