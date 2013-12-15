require 'spec_helper'

class ExampleClass < FanartApi::Base
end

describe FanartApi::Base do
  let(:klass) { ExampleClass }

  describe '.api_key' do
    it 'should use default api_key' do
      klass.new(FanartApi::Client.new).api_key.should == FanartApi::Configuration.api_key
    end

    it 'should set api_key' do
      klass.new(FanartApi::Client.new('API_KEY')).api_key.should == 'API_KEY'
    end
  end
end
