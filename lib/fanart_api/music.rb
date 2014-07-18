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

  def latest(options = {})
    latest_path_with_params(options).get
  end

  def latest_url(options = {})
    latest_path_with_params(options).url
  end

  private

  def artist_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :music))
  end

  def album_path_with_params(options)
    path_with_params(album_path, options.merge(kind: :music))
  end

  def label_path_with_params(options)
    path_with_params(label_path, options.merge(kind: :music))
  end

  def latest_path_with_params(options)
    path_with_params(latest_path, options.merge(kind: :music))
  end

  def album_path
    ':kind/albums/:id'
  end

  def label_path
    ':kind/labels/:id'
  end
end
