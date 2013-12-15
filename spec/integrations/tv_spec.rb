require 'spec_helper'

describe FanartApi::Tv do
  let(:klass) { FanartApi::Tv }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.find' do
    it 'should return response class' do
      model.find('70346').class.should == HTTParty::Response
    end
  end

  describe '.update' do
    it 'should call get with specific uri' do
      model.update.class.should == HTTParty::Response
    end
  end
end
