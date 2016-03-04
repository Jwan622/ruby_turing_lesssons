require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "Jeff"
    }
  end

  test 'it is a valid User' do
    user = User.new(:name => "Jeff")
    assert user.valid?
    assert_equal "Jeff", user.name
  end

  test 'it is an invalid user' do
    user = User.new
    assert user.invalid?
  end


  test 'user can have many photos' do
    user = User.new(:name => "jeff")
    assert_equal [], user.photos
  end

  test 'user has many photos' do
    user = User.create(:name => "Jeff")
    photo = Photo.create(:name => "Grand Canyon", :user_id => user.id)
    photo = Photo.create(:name => "Colorado Rockies", :user_id => user.id)

    assert_equal 2, user.photos.count
    assert_equal "Grand Canyon", user.photos.first.name
  end
end
