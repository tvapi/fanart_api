require 'spec_helper'

describe FanartApi::Music do
  let(:klass) { FanartApi::Music }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.artist' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('artist/API_KEY/1234/json/all/1/2')

      model.artist(1234)
    end
  end

  describe '.album' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('album/API_KEY/1234/json/all/1/2')

      model.album(1234)
    end
  end

  describe '.label' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('label/API_KEY/1234/json/all/1/2')

      model.label(1234)
    end
  end

  describe '.update' do
    it 'should call get with specific uri' do
      model.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:get).with('newmusic/API_KEY/1234')

      model.update(1234)
    end
  end
end
