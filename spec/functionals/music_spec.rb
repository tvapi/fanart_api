require 'spec_helper'

describe FanartApi::Music do
  let(:client) { FanartApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.music }

  let(:music_data) { File.read('spec/fixtures/artist.json') }
  let(:latest_music_data) { File.read('spec/fixtures/latest_artist.json') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/v3/music/1234?api_key=123456789') { [200, { content_type: 'json' }, music_data] }
      stub.get('/v3/music/albums/1234?api_key=123456789') { [200, { content_type: 'json' }, music_data] }
      stub.get('/v3/music/labels/1234?api_key=123456789') { [200, { content_type: 'json' }, music_data] }
      stub.get('/v3/music/latest?api_key=123456789&date=123') { [200, { content_type: 'json' }, latest_music_data] }
    end
  end

  describe '.artist' do
    it 'should return Faraday::Response class' do
      model.artist(id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.artist(id: 1234).body == Hash
    end
  end

  describe '.artist_url' do
    it 'should return correct url' do
      model.artist_url(id: 1234).should == 'http://fanarttv.apiary-proxy.com/v3/music/1234?api_key=123456789'
    end
  end

  describe '.album' do
    it 'should return Faraday::Response class' do
      model.album(id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.album(id: 1234).body == Hash
    end
  end

  describe '.album_url' do
    it 'should return correct url' do
      model.album_url(id: 1234).should == 'http://fanarttv.apiary-proxy.com/v3/music/albums/1234?api_key=123456789'
    end
  end

  describe '.label' do
    it 'should return Faraday::Response class' do
      model.label(id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.label(id: 1234).body == Hash
    end
  end

  describe '.label_url' do
    it 'should return correct url' do
      model.label_url(id: 1234).should == 'http://fanarttv.apiary-proxy.com/v3/music/labels/1234?api_key=123456789'
    end
  end

  describe '.latest' do
    it 'should return Faraday::Response class' do
      model.latest(date: 123).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.latest(date: 123).body == Hash
    end
  end

  describe '.latest_url' do
    it 'should return correct url' do
      model.latest_url(date: 123).should == 'http://fanarttv.apiary-proxy.com/v3/music/latest?api_key=123456789&date=123'
    end
  end
end
