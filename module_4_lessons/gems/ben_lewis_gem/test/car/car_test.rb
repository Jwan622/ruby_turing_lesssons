require './test/test_helper'

class BenzinatorCarTest < Minitest::Test
  def test_exists
    assert BenLewisGem::Car
  end

  def test_it_gives_back_a_single_car
    VCR.use_cassette('one car') do
      car = BenLewisGem::Car.find(68)
      assert_equal BenLewisGem::Car, car.class

      assert_equal 68, car.id
      assert_equal "Honda", car.make
      assert_equal "Civic", car.model
      assert_equal "1996", car.year
      assert_equal "Blue", car.color
      assert_equal "XXXXXXXXXXXXXX", car.vin
      assert_equal 34, car.dealer_id
    end
  end
end
