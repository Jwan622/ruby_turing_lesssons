require 'test_helper'
require 'yaml_parser.rb'

class YamlParserTest < ActiveSupport::TestCase
  def test_yaml_parser_works
    data = YamlParser.parse
    assert_equal "778051d4e0bd2daff263071145cfe3b9b452ae71", data["production"]["census_api_key"]
  end

  def test_hashie_mash_works
    data = Hashie::Mash.new(YamlParser.parse)
    assert_equal "778051d4e0bd2daff263071145cfe3b9b452ae71", data.production.census_api_key
  end
end
