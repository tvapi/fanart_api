require 'spec_helper'

class ExampleClass < FanartApi::Base
end

describe FanartApi::Base do
  let(:klass) { ExampleClass }
  let(:model) { klass.new(FanartApi::Client.new) }

  describe '.get' do
    it 'should set @uri_template' do
      model.get('http://example.com')

      model.instance_variable_get('@uri_template').class.should == URITemplate::RFC6570
    end

    it 'should return self' do
      model.get('http://example.com').should == model
    end
  end

  describe '.params' do
    it 'should set @params' do
      model.params(sample: 'test')

      model.instance_variable_get('@params').should == { sample: 'test' }
    end

    it 'should return self' do
      model.params(sample: 'test').should == model
    end
  end

  describe '.response' do
    it 'should call get klass method' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))
      klass.should_receive(:get)

      model.response
    end
  end

  describe '.prepare_uri' do
    it 'should receive correct uri string' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))

      model.prepare_uri.should == "#{FanartApi::Configuration.api_key}/series/"
    end
  end

  describe '.uri' do
    it 'should receive correct uri string' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))
      model.instance_variable_set('@params', id: '1234')

      model.uri.should == "#{FanartApi::Configuration.api_key}/series/1234"
    end
  end

  describe '.restful_param_keys' do
    it 'should receive correct uri string' do
      uri_template = URITemplate.new('{api_key}/series/{id}')
      model.instance_variable_set('@uri_template', uri_template)

      model.restful_param_keys(uri_template.expand).sort.should == ['api_key', 'id'].sort
    end
  end

  describe '.shared_uri' do
    it 'should return correct string' do
      model.shared_uri.should == '{api_key}/{id}/json/{type}/{sort}/{limit}'
    end
  end
end
