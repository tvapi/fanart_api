class FanartApi::Movie < FanartApi::Base
  include Ov

  # Find specific movie data.
  #
  # access: FREE
  # param:
  #   find(1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#movies
  let :find, Any do |id|
    find(id: id)
  end


  # Find specific movie data.
  #
  # access: FREE
  # param:
  #   find(id: 1234)
  # output: Faraday::Response instance with Hash body
  # example: http://docs.fanarttv.apiary.io/#movies
  let :find, Hash do |options|
    find_path_with_params(options).get
  end

  # Find specific movie data - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234)
  # output: url string
  let :find_url, Any do |id|
    find_url(id: id)
  end

  # Find specific movie data - return only url.
  #
  # access: FREE
  # param:
  #   find_url(id: 1234)
  # output: url string
  let :find_url, Hash do |options|
    find_path_with_params(options).url
  end

  # Get latest movies data.
  #
  # access: FREE
  # param:
  #   latest
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#movies
  let :latest do |date|
    latest({})
  end

  # Get latest movies data.
  #
  # access: FREE
  # param:
  #   latest(1234)
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#movies
  let :latest, Any do |date|
    latest(date: date)
  end


  # Get latest movies data.
  #
  # access: FREE
  # param:
  #   latest(date: 1234)
  # output: Faraday::Response instance with Array body
  # example: http://docs.fanarttv.apiary.io/#movies
  let :latest, Hash do |options|
    latest_path_with_params(options).get
  end

  # Get latest movies data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url
  # output: url string
  let :latest_url do |date|
    latest_url({})
  end

  # Get latest movies data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url(1234)
  # output: url string
  let :latest_url, Any do |date|
    latest_url(date: date)
  end

  # Get latest movies data - return only url.
  #
  # access: FREE
  # param:
  #   latest_url(date: 1234)
  # output: url string
  let :latest_url, Hash do |options|
    latest_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :movies))
  end

  def latest_path_with_params(options)
    path_with_params(latest_path, options.merge(kind: :movies))
  end
end
