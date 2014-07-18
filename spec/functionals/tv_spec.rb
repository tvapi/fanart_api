require 'spec_helper'

describe FanartApi::Tv do
  let(:client) { FanartApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.tv }

  let(:tv_data) { File.read('spec/fixtures/find_tv.json') }
  let(:latest_tv_data) { File.read('spec/fixtures/latest_tv.json') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/v3/tv/1234?api_key=123456789') { [200, { content_type: 'json' }, tv_data] }
      stub.get('/v3/tv/latest?api_key=123456789&date=123') { [200, { content_type: 'json' }, latest_tv_data] }
    end
  end

  describe '.find' do
    it 'should return Faraday::Response class' do
      model.find(id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find(id: 1234).body == Hash
    end
  end

  describe '.find_url' do
    it 'should return correct url' do
      model.find_url(id: 1234).should == 'http://fanarttv.apiary-proxy.com/v3/tv/1234?api_key=123456789'
    end
  end

  describe '.latest' do
    it 'should return Faraday::Response class' do
      model.latest(date: 123).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.latest(date: 123).body == Array
    end
  end

  describe '.latest_url' do
    it 'should return correct url' do
      model.latest_url(date: 123).should == 'http://fanarttv.apiary-proxy.com/v3/tv/latest?api_key=123456789&date=123'
    end
  end
end
