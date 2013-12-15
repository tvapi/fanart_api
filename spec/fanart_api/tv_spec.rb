require 'spec_helper'

describe FanartApi::Tv do
  let(:klass) { FanartApi::Tv }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.find' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('series/API_KEY/1234/json/all/1/2')

      model.find(1234)
    end
  end

  describe '.update' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('newtv/API_KEY/1234')

      model.update(1234)
    end
  end
end
