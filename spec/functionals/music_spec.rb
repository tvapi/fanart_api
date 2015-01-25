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
      stub.get('/v3/music/latest?api_key=123456789') { [200, { content_type: 'json' }, latest_music_data] }
    end
  end

  describe '.artist' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.artist(id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.artist(id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.artist(1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.artist(1234).body).to be_a(Hash)
      end
    end
  end

  describe '.artist_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.artist_url(id: 1234)).to eq('http://webservice.fanart.tv/v3/music/1234?api_key=123456789')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.artist_url(1234)).to eq('http://webservice.fanart.tv/v3/music/1234?api_key=123456789')
      end
    end
  end

  describe '.album' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.album(id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.album(id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.album(1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.album(1234).body).to be_a(Hash)
      end
    end
  end

  describe '.album_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.album_url(id: 1234)).to eq('http://webservice.fanart.tv/v3/music/albums/1234?api_key=123456789')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.album_url(1234)).to eq('http://webservice.fanart.tv/v3/music/albums/1234?api_key=123456789')
      end
    end
  end

  describe '.label' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.label(id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.label(id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.label(1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.label(1234).body).to be_a(Hash)
      end
    end
  end

  describe '.label_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.label_url(id: 1234)).to eq('http://webservice.fanart.tv/v3/music/labels/1234?api_key=123456789')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.label_url(1234)).to eq('http://webservice.fanart.tv/v3/music/labels/1234?api_key=123456789')
      end
    end
  end

  describe '.latest' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.latest(date: 123)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.latest(date: 123).body).to be_a(Array)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.latest(123)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.latest(123).body).to be_a(Array)
      end
    end

    context 'without attributes' do
      it 'should return Faraday::Response class' do
        expect(model.latest).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.latest.body).to be_a(Array)
      end
    end
  end

  describe '.latest_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.latest_url(date: 123)).to eq('http://webservice.fanart.tv/v3/music/latest?api_key=123456789&date=123')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.latest_url(123)).to eq('http://webservice.fanart.tv/v3/music/latest?api_key=123456789&date=123')
      end
    end

    context 'without attributes' do
      it 'should return correct url' do
        expect(model.latest_url).to eq('http://webservice.fanart.tv/v3/music/latest?api_key=123456789')
      end
    end
  end
end
