require 'confiture'

class FanartApi::Configuration
  include Confiture::Configuration

  confiture_allowed_keys(:api_key)
end
