require 'spec_helper'

describe FanartApi::Movie do
  let(:client) { FanartApi::Client.new(api_key: API_KEY) }
  let(:model) { client.movie }

  describe 'real request' do
    describe '.find' do
      it 'should return response class' do
        response = model.find('tt0120737')
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
