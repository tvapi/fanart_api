require 'spec_helper'

describe FanartApi::Movie do
  let(:client) { FanartApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.movie }

  let(:movies_data) { File.read('spec/fixtures/find_movies.json') }
  let(:latest_movies_data) { File.read('spec/fixtures/latest_movies.json') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/v3/movies/1234?api_key=123456789') { [200, { content_type: 'json' }, movies_data] }
      stub.get('/v3/movies/latest?api_key=123456789&date=123') { [200, { content_type: 'json' }, latest_movies_data] }
    end
  end

  describe '.find' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find(id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find(id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find(1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find(1234).body).to be_a(Hash)
      end
    end
  end

  describe '.find_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.find_url(id: 1234)).to eq('http://webservice.fanart.tv/v3/movies/1234?api_key=123456789')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.find_url(1234)).to eq('http://webservice.fanart.tv/v3/movies/1234?api_key=123456789')
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
  end

  describe '.latest_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.latest_url(date: 123)).to eq('http://webservice.fanart.tv/v3/movies/latest?api_key=123456789&date=123')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.latest_url(123)).to eq('http://webservice.fanart.tv/v3/movies/latest?api_key=123456789&date=123')
      end
    end
  end
end
