require 'spec_helper'

describe FanartApi::Movie do
  let(:client) { FanartApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.movie }

  let(:movies_data) { File.read('spec/fixtures/find_movies.json') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/webservice/movie/123456789/1234/json/all/1/2') { [200, { content_type: 'json' }, movies_data] }
      stub.get('/webservice/newmovies/123456789/123') { [200, { content_type: 'json' }, {}] }
    end
  end

  describe '.find' do
    it 'should return Faraday::Response class' do
      model.find(id: 1234, type: 'all', sort: '1', limit: 2).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find(id: 1234, type: 'all', sort: '1', limit: 2).body == Hash
    end
  end

  describe '.find_url' do
    it 'should return correct url' do
      model.find_url(id: 1234, type: 'all', sort: '1', limit: 2).should == 'http://api.fanart.tv/webservice/movie/123456789/1234/json/all/1/2'
    end
  end

  describe '.update' do
    it 'should return Faraday::Response class' do
      model.update(timestamp: 123).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.update(timestamp: 123).body == Hash
    end
  end

  describe '.update_url' do
    it 'should return correct url' do
      model.update_url(timestamp: 123).should == 'http://api.fanart.tv/webservice/newmovies/123456789/123'
    end
  end
end
