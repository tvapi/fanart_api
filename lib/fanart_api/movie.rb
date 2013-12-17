# documentation: http://fanart.tv/api-docs/movie-api
class FanartApi::Movie < FanartApi::Base
  def find(id, type = 'all', sort = '1', limit = '2')
    get("movies/#{shared_uri}").params(id: id, type: type, sort: sort, limit: limit).response
  end

  def update(timestamp = (Time.now - 172800).to_i)
    get('newmovies/{api_key}/{timestamp}').params(timestamp: timestamp).response
  end
end