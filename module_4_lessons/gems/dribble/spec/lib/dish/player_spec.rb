require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe "dish/player" do
  it "must work" do
    expect("Yay!").to be_a String
  end
end

describe Dish::Player do

  describe "default attributes" do

    it "must include httparty methods" do
      Dish::Player.must_include HTTParty
    end

    it "must have the base url set to the Dribble API endpoint" do
      Dish::Player.base_uri.must_equal 'http://api.dribbble.com'
    end

  end

end
