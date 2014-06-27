# documentation: http://fanart.tv/api-docs/movie-api
class FanartApi::Movie < FanartApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def update(options = {})
    update_path_with_params(options).get
  end

  def update_url(options = {})
    update_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path_with_params(find_path, options.merge(kind: :movie))
  end

  def update_path_with_params(options)
    path_with_params(update_path, options.merge(kind: :newmovies))
  end
end
