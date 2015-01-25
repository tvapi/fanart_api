require 'spec_helper'

describe FanartApi::Music do
  let(:client) { FanartApi::Client.new(api_key: API_KEY) }
  let(:model) { client.music }

  describe 'real request' do
    describe '.artist' do
      it 'should return response class' do
        response = model.artist('f4a31f0a-51dd-4fa7-986d-3095c40c5ed9')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.album' do
      it 'should return response class' do
        response = model.album('9ba659df-5814-32f6-b95f-02b738698e7c')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.label' do
      it 'should return response class' do
        response = model.label('e832b688-546b-45e3-83e5-9f8db5dcde1d')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.latest' do
      it 'should return response class' do
        response = model.latest
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Array)
      end
    end
  end
end
