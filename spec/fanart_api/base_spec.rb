require 'spec_helper'

class ExampleClass < FanartApi::Base
end

describe FanartApi::Base do
  let(:klass) { ExampleClass }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.api_key' do
    it 'should use default api_key' do
      model.api_key.should == FanartApi::Configuration.api_key
    end

    it 'should set api_key' do
      klass.new(FanartApi::Client.new('API_KEY')).api_key.should == 'API_KEY'
    end
  end

  describe '.shared_uri' do
    it 'should return correct string' do
      model.stub(:api_key).and_return('API_KEY')

      model.shared_uri('ID', 'TYPE', 'SORT', 'LIMIT').should == "/API_KEY/ID/json/TYPE/SORT/LIMIT"
    end
  end
end
