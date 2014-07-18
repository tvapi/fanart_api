# documentation: http://fanart.tv/api-docs/movie-api
class FanartApi::Movie < FanartApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def latest(options = {})
    latest_path_with_params(options).get
  end

  def latest_url(options = {})
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
