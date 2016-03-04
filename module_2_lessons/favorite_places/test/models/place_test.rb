require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: "estes park"
    }
  end

  test "it is a valid place" do
    place = Place.new(valid_attributes)
    assert place.valid?
  end

  test "it is an invalid place" do
    place = Place.new
    assert place.invalid?
  end

  test 'it can have users' do
    place = Place.new(valid_attributes)
    assert_equal [], place.users
  end

  test "it has many users" do
    place = Place.create(valid_attributes)
    place.users.create(:name => "jeff")
    assert_equal 1, place.users.count
  end
end
