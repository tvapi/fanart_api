require 'spec_helper'

describe FanartApi::Movie do
  let(:klass) { FanartApi::Movie }
  let(:model) { klass.new(FanartApi::Client.new) }
  let(:mock_model) { SampleModel.new }

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('movie/{api_key}/{id}/json/{type}/{sort}/{limit}').and_return(mock_model)

      model.find('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(id: '1234', type: 'all', sort: '1', limit: '2').and_return(mock_model)

      model.find('1234')
    end
  end

  describe '.update' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('newmovies/{api_key}/{timestamp}').and_return(mock_model)

      model.update(1234)
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(timestamp: 1234).and_return(mock_model)

      model.update(1234)
    end
  end
end
