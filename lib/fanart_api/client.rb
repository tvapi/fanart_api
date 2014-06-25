require 'httparty'

class FanartApi::Client
  attr_reader :api_key

  def initialize(options = {})
    @api_key = options[:api_key]
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
