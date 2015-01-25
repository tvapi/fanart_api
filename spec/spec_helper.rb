require 'coveralls'
Coveralls.wear!

require 'awesome_print'
require 'fanart_api'

Dir['spec/support/**/*.rb'].each { |f| require "./#{f}" }
