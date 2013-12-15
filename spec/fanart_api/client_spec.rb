require 'spec_helper'

describe FanartApi::Client do
  let(:model) { FanartApi::Client.new }

  describe '.movie' do
    it 'should return movie class' do
      model.movie.class.should == FanartApi::Movie
    end
  end

  describe '.music' do
    it 'should return music class' do
      model.music.class.should == FanartApi::Music
    end
  end

  describe '.tv' do
    it 'should return tv class' do
      model.tv.class.should == FanartApi::Tv
    end
  end
end
