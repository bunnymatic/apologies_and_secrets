require File.dirname(__FILE__) + '/spec_helper'

describe ApologiesAndSecrets do
  include Rack::Test::Methods

  def app
    @app ||= ApologiesAndSecrets
  end

  describe '#root' do
    it 'should return success' do
      get '/'
      last_response.should be_ok
    end
  end

  describe '#apologies' do
    it 'should return success' do
      get '/apologies'
      last_response.should be_ok
    end
  end

  describe '#secrets' do
    it 'should return success' do
      get '/secrets'
      last_response.should be_ok
    end
  end

end
