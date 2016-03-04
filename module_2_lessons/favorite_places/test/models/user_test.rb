require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "Jeff"
    }
  end

  test "it is a valid user" do
    jeff = User.new(valid_attributes)
    assert jeff.valid?
  end

  test 'it is an invalid user' do
    jeff = User.new
    assert jeff.invalid?
  end

  test 'user can have a places' do
    jeff = User.create(valid_attributes)
    assert_equal [], jeff.places
  end

  test 'user can have many places' do
    jeff = User.create(valid_attributes)
    jeff.places.create(name: "grand canyon")
    assert_equal 1, jeff.places.count
    jeff.places.create(name: "estes park")
    assert_equal 2, jeff.places.count
  end
end
