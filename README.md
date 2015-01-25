[![Build Status](https://travis-ci.org/tvapi/fanart_api.png?branch=master)](https://travis-ci.org/tvapi/fanart_api)
[![Dependency Status](https://gemnasium.com/tvapi/fanart_api.png)](https://gemnasium.com/tvapi/fanart_api)
[![Code Climate](https://codeclimate.com/github/tvapi/fanart_api.png)](https://codeclimate.com/github/tvapi/fanart_api)
[![Coverage Status](https://coveralls.io/repos/tvapi/fanart_api/badge.png)](https://coveralls.io/r/tvapi/fanart_api)
[![Gem Version](https://badge.fury.io/rb/fanart_api.png)](http://badge.fury.io/rb/fanart_api)

# FanartApi

fanart_api is a simple ruby client for accessing TV shows information from the fanart.tv API.

## Installation

With Bundler:

```ruby
gem 'thetvdb_api'
```

```ruby
$ bundle install
```

Otherwhise:

```ruby
$ gem install thetvdb_api
```

## How to use

You have two way for access to api:

```ruby
client = FanartApi::Client.new(api_key: '...')
```
```ruby
client = FanartApi::Client.new(api_key: '...', proxy_url: '...')
client.movie # => #<FanartApi::Movie>
client.music # => #<FanartApi::Music>
client.tv # => #<FanartApi::Tv>
```

* II case (direct access to api class, many entry points)

Language attribute is required

```ruby
ThetvdbApi::Actor.new(api_key: '...')
ThetvdbApi::Banner.new(api_key: '...')
ThetvdbApi::Episode.new(api_key: '...')
```

```ruby
ThetvdbApi::Actor.new(api_key: '...', proxy_url: '...')
ThetvdbApi::Banner.new(api_key: '...', proxy_url: '...')
ThetvdbApi::Episode.new(api_key: '...', proxy_url: '...')
```

## Methods

For all methods you can pass hash attributes or multiple attributes specified in method comment.

### Movie methods

For method attributes read https://github.com/tvapi/fanart_api/blob/master/lib/fanart_api/movie.rb

* find
* find_url
* latest
* latest_url

### Music methods

For method attributes read https://github.com/tvapi/fanart_api/blob/master/lib/fanart_api/music.rb

* artist
* artist_url
* album
* album_url
* label
* label_url
* latest
* latest_url

### Tv methods

For method attributes read https://github.com/tvapi/fanart_api/blob/master/lib/fanart_api/tv.rb

* find
* find_url
* latest
* latest_url

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
