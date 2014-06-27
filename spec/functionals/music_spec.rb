require 'spec_helper'

describe FanartApi::Music do
  let(:client) { FanartApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.music }

  let(:music_data) { File.read('spec/fixtures/artist.json') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/webservice/artist/123456789/1234/json/all/1/2') { [200, { content_type: 'json' }, music_data] }
      stub.get('/webservice/album/123456789/1234/json/all/1/2') { [200, { content_type: 'json' }, music_data] }
      stub.get('/webservice/label/123456789/1234/json/all/1/2') { [200, { content_type: 'json' }, music_data] }
      stub.get('/webservice/newmusic/123456789/123') { [200, { content_type: 'json' }, {}] }
    end
  end

  describe '.artist' do
    it 'should return Faraday::Response class' do
      model.artist(id: 1234, type: 'all', sort: '1', limit: 2).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.artist(id: 1234, type: 'all', sort: '1', limit: 2).body == Hash
    end
  end

  describe '.artist_url' do
    it 'should return correct url' do
      model.artist_url(id: 1234, type: 'all', sort: '1', limit: 2).should == 'http://api.fanart.tv/webservice/artist/123456789/1234/json/all/1/2'
    end
  end

  describe '.album' do
    it 'should return Faraday::Response class' do
      model.album(id: 1234, type: 'all', sort: '1', limit: 2).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.album(id: 1234, type: 'all', sort: '1', limit: 2).body == Hash
    end
  end

  describe '.album_url' do
    it 'should return correct url' do
      model.album_url(id: 1234, type: 'all', sort: '1', limit: 2).should == 'http://api.fanart.tv/webservice/album/123456789/1234/json/all/1/2'
    end
  end

  describe '.label' do
    it 'should return Faraday::Response class' do
      model.label(id: 1234, type: 'all', sort: '1', limit: 2).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.label(id: 1234, type: 'all', sort: '1', limit: 2).body == Hash
    end
  end

  describe '.label_url' do
    it 'should return correct url' do
      model.label_url(id: 1234, type: 'all', sort: '1', limit: 2).should == 'http://api.fanart.tv/webservice/label/123456789/1234/json/all/1/2'
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
      model.update_url(timestamp: 123).should == 'http://api.fanart.tv/webservice/newmusic/123456789/123'
    end
  end
end
