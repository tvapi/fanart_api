require 'spec_helper'

describe FanartApi::Music do
  let(:klass) { FanartApi::Music }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.artist' do
    it 'should return response class' do
      model.artist('f4a31f0a-51dd-4fa7-986d-3095c40c5ed9').class.should == HTTParty::Response
    end
  end

  describe '.album' do
    it 'should return response class' do
      model.album('f4a31f0a-51dd-4fa7-986d-3095c40c5ed9').class.should == HTTParty::Response
    end
  end

  describe '.label' do
    it 'should return response class' do
      model.label('f4a31f0a-51dd-4fa7-986d-3095c40c5ed9').class.should == HTTParty::Response
    end
  end

  describe '.update' do
    it 'should call get with specific uri' do
      model.update.class.should == HTTParty::Response
    end
  end
end
