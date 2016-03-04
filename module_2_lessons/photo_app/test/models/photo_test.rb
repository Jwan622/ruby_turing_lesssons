require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "family trip",
      user_id: "1"
    }
  end


  test "it creates a valid Photo" do
    photo = Photo.new(valid_attributes)

    assert photo.valid?
    assert_equal "family trip", photo.name
  end

  test 'it creates an invalid Photo' do
    photo = Photo.new
    assert photo.invalid?
  end

  test 'it can have a user' do
    photo = Photo.new(:name => "estes park")
    assert_equal nil, photo.user
  end

  test 'it has a user' do
    user = User.create(:name => "Jeff")
    user.photos.create(:name => "estes park")
    photo = Photo.find_by(name: "estes park")
    assert_equal user.id, photo.user_id
  end
end
