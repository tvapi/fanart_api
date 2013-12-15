# documentation: http://fanart.tv/api-docs/music-api
class FanartApi::Music < FanartApi::Base
  def initialize(client)
    super(client)

    [:artist, :album, :label].each do |method_name|
      define_method(method_name) do |id, type = 'all', sort = '1', limit = '2'|
        self.class.get("#{method_name}#{shared_uri(id, type, sort, limit)}")
      end
    end
  end

  def update(timestamp = (Time.now - 172800).to_i)
    self.class.get("newmusic/#{api_key}/#{timestamp}")
  end
end
