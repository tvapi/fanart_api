# documentation: http://fanart.tv/api-docs/tv-api
class FanartApi::Tv < FanartApi::Base
  def find(id, type = 'all', sort = '1', limit = '2')
    self.class.get("series/#{api_key}/#{id}/json/#{type}/#{sort}/#{limit}")
  end

  def update(timestamp = (Time.now - 172800).to_i)
    self.class.get("newtv/#{api_key}/#{timestamp}")
  end
end