# documentation: http://fanart.tv/api-docs/music-api
class FanartApi::Music < FanartApi::Base
  def artist(options = {})
    artist_path_with_params(options).get
  end

  def artist_url(options = {})
    artist_path_with_params(options).url
  end

  def album(options = {})
    album_path_with_params(options).get
  end

  def album_url(options = {})
    album_path_with_params(options).url
  end

  def label(options = {})
    label_path_with_params(options).get
  end

  def label_url(options = {})
    label_path_with_params(options).url
  end

  def update(options = {})
    update_path_with_params(options).get
  end

  def update_url(options = {})
    update_path_with_params(options).url
  end

  private

  def artist_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :artist))
  end

  def album_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :album))
  end

  def label_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :label))
  end

  def update_path_with_params(options)
    path_with_params(update_path, options.merge(kind: :newmusic))
  end
end
