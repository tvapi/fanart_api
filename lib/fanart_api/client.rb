class FanartApi::Client
  attr_reader :config

  def initialize(config = {})
    @config = config

    @config[:adapter] ||= :net_http
  end

  def movie
    @movie ||= FanartApi::Movie.new(config)
  end

  def music
    @music ||= FanartApi::Music.new(config)
  end

  def tv
    @tv ||= FanartApi::Tv.new(config)
  end
end
