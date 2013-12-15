# documentation: http://fanart.tv/api-docs/music-api
class FanartApi::Music < FanartApi::Base
  def artist(id, type = 'all', sort = '1', limit = '2')
    self.class.get("artist/#{api_key}/#{id}/json/#{type}/#{sort}/#{limit}")
  end

  def album(id, type = 'all', sort = '1', limit = '2')
    self.class.get("album/#{api_key}/#{id}/json/#{type}/#{sort}/#{limit}")
  end

  def label(id, type = 'all', sort = '1', limit = '2')
    self.class.get("label/#{api_key}/#{id}/json/#{type}/#{sort}/#{limit}")
  end

  def update(timestamp = (Time.now - 172800).to_i)
    self.class.get("newmusic/#{api_key}/#{timestamp}")
  end
end
