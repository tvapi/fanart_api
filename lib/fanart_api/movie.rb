# documentation: http://fanart.tv/api-docs/movie-api
class FanartApi::Movie < FanartApi::Base
  def find(id, type = 'all', sort = '1', limit = '2')
    self.class.get("movie/#{api_key}/#{id}/json/#{type}/#{sort}/#{limit}")
  end

  def update(timestamp = (Time.now - 172800).to_i)
    self.class.get("newmovies/#{api_key}/#{timestamp}")
  end
end