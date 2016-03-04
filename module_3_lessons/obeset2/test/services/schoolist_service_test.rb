require "test_helper"

class SchoolistServiceTest < Minitest::Test

  def test_it_retrieves_all_schools
    VCR.use_cassette("schools") do
      service = SchoolistService.new

      school_data = service.schools

      assert_equal "18.5", school_data.first["overweight_percentage"]
      assert_equal "20.8", school_data.first["obese_percentage"]
    end
  end

  def test_it_finds_a_single_school
    service = SchoolistService.new
    data = service.school(1)
  end
end
