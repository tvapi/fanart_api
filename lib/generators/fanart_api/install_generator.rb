module FanartApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a FanartApi::Configuration initializer and copy locale files to your application.'
      def copy_initializer
        template 'fanart_api.rb', 'config/initializers/fanart_api.rb'
      end
    end
  end
end
