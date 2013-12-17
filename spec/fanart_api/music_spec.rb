require 'spec_helper'

describe FanartApi::Music do
  let(:klass) { FanartApi::Music }
  let(:model) { klass.new(FanartApi::Client.new) }
  let(:mock_model) { SampleModel.new }

  describe '.artist' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('artist/{api_key}/{id}/json/{type}/{sort}/{limit}').and_return(mock_model)

      model.artist('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(id: '1234', type: 'all', sort: '1', limit: '2').and_return(mock_model)

      model.artist('1234')
    end
  end

  describe '.album' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('album/{api_key}/{id}/json/{type}/{sort}/{limit}').and_return(mock_model)

      model.album('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(id: '1234', type: 'all', sort: '1', limit: '2').and_return(mock_model)

      model.album('1234')
    end
  end

  describe '.label' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('label/{api_key}/{id}/json/{type}/{sort}/{limit}').and_return(mock_model)

      model.label('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(id: '1234', type: 'all', sort: '1', limit: '2').and_return(mock_model)

      model.label('1234')
    end
  end

  describe '.update' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('newmusic/{api_key}/{timestamp}').and_return(mock_model)

      model.update(1234)
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(timestamp: 1234).and_return(mock_model)

      model.update(1234)
    end
  end
end
