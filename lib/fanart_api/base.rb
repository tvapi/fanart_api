require 'service_api'

class FanartApi::Base
  include ServiceApi::BaseFaraday

  def api_key_options
    { api_key: @client.options[:api_key] }
  end

  def path_with_params(path, options)
    path(path).params(api_key_options.merge(options))
  end

  def find_path
    ':kind/:api_key/:id/json/:type/:sort/:limit'
  end

  def update_path
    ':kind/:api_key/:timestamp'
  end

  def default_options
    {
      type: 'all',
      sort: 1,
      limit: 2
    }
  end

  private

  def uri_kind
    :colon
  end

  def base_url
    'http://api.fanart.tv/webservice/'
  end

  # def shared_uri
  #   '{api_key}/{id}/json/{type}/{sort}/{limit}'
  # end
end