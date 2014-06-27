class FanartApi::Client
  attr_reader :options

  def initialize(options = {})
    @options = options

    @options[:adapter] ||= :net_http
  end

  def movie
    @movie ||= FanartApi::Movie.new(self)
  end

  def music
    @music ||= FanartApi::Music.new(self)
  end

  def tv
    @tv ||= FanartApi::Tv.new(self)
  end
end
