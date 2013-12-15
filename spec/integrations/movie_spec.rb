require 'spec_helper'

describe FanartApi::Movie do
  let(:klass) { FanartApi::Movie }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.find' do
    it 'should return response class' do
      model.find('tt0120737').class.should == HTTParty::Response
    end
  end

  describe '.update' do
    it 'should call get with specific uri' do
      model.update.class.should == HTTParty::Response
    end
  end
end
