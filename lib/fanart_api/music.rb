class FanartApi::Music < FanartApi::Base
  include Ov

  # Find specific artist data.
  #
  # access: FREE
  # param:
  #   artist(1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :artist, Any do |id|
    artist(id: id)
  end

  # Find specific artist data.
  #
  # access: FREE
  # param:
  #   artist(id: 1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :artist, Hash do |options|
    artist_path_with_params(options).get
  end

  # Find specific artist data - return only url.
  #
  # access: FREE
  # param:
  #   artist_url(1234)
  # output: url string
  let :artist_url, Any do |id|
    artist_url(id: id)
  end

  # Find specific artist data - return only url.
  #
  # access: FREE
  # param:
  #   artist_url(id: 1234)
  # output: url string
  let :artist_url, Hash do |options|
    artist_path_with_params(options).url
  end

  # Find specific album data.
  #
  # access: FREE
  # param:
  #   album(1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :album, Any do |id|
    album(id: id)
  end

  # Find specific album data.
  #
  # access: FREE
  # param:
  #   album(id: 1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :album, Hash do |options|
    album_path_with_params(options).get
  end

  # Find specific album data - return only url.
  #
  # access: FREE
  # param:
  #   album_url(1234)
  # output: url string
  let :album_url, Any do |id|
    album_url(id: id)
  end

  # Find specific album data - return only url.
  #
  # access: FREE
  # param:
  #   album_url(id: 1234)
  # output: url string
  let :album_url, Hash do |options|
    album_path_with_params(options).url
  end

  # Find specific label data.
  #
  # access: FREE
  # param:
  #   label(1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :label, Any do |id|
    label(id: id)
  end

  # Find specific label data.
  #
  # access: FREE
  # param:
  #   label(id: 1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#music
  let :label, Hash do |options|
    label_path_with_params(options).get
  end

  # Find specific label data - return only url.
  #
  # access: FREE
  # param:
  #   label_url(1234)
  # output: url string
  let :label_url, Any do |id|
    label_url(id: id)
  end

  # Find specific label data - return only url.
  #
  # access: FREE
  # param:
  #   label_url(id: 1234)
  # output: url string
  let :label_url, Hash do |options|
    label_path_with_params(options).url
  end

  # Get latest artists data.
  #
  # access: FREE
  # param:
  #   latest
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#tv
  let :latest do |date|
    latest({})
  end

  # Get latest artists data.
  #
  # access: FREE
  # param:
  #   latest(1234)
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#tv
  let :latest, Any do |date|
    latest(date: date)
  end

  # Get latest artists data.
  #
  # access: FREE
  # param:
  #   latest(date: 1234)
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#tv
  let :latest, Hash do |options|
    latest_path_with_params(options).get
  end

  # Get latest artists data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url
  # output: url string
  let :latest_url do |date|
    latest_url({})
  end

  # Get latest artists data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url(1234)
  # output: url string
  let :latest_url, Any do |date|
    latest_url(date: date)
  end

  # Get latest artists data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url(date: 1234)
  # output: url string
  let :latest_url, Hash do |options|
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
