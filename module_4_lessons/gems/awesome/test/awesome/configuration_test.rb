require 'helper'

describe 'configuration' do

  after do
    Awesome.reset
  end

  Awesome::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Awesome.send(key).must_equal Awesome::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

  describe '.api_key' do
    it 'should return default key' do
      Awesome.api_key.must_equal Awesome::Configuration::DEFAULT_API_KEY
    end
  end

  describe '.format' do
    it 'should return default format' do
      Awesome.format.must_equal Awesome::Configuration::DEFAULT_FORMAT
    end
  end

  describe '.user_agent' do
    it 'should return default user agent' do
      Awesome.user_agent.must_equal Awesome::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe '.method' do
    it 'should return default http method' do
      Awesome.method.must_equal Awesome::Configuration::DEFAULT_METHOD
    end
  end

end
