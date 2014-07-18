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
    ':kind/:id'
  end

  def latest_path
    ':kind/latest'
  end

  private

  def uri_kind
    :colon
  end

  def base_url
    if @client.options[:proxy] == false
      'http://webservice.fanart.tv/v3/'
    else
      'http://fanarttv.apiary-proxy.com/v3/'
    end
  end
end