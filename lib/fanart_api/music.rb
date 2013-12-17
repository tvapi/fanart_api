# documentation: http://fanart.tv/api-docs/music-api
class FanartApi::Music < FanartApi::Base
  [:artist, :album, :label].each do |method_name|
    define_method(method_name) do |id, type = 'all', sort = '1', limit = '2'|
      get("#{method_name}/#{shared_uri}").params(id: id, type: type, sort: sort, limit: limit).response
    end
  end

  def update(timestamp = (Time.now - 172800).to_i)
    get('newmusic/{api_key}/{timestamp}').params(timestamp: timestamp).response
  end
end
