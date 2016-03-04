require 'test_helper'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

class SchoolListTest < ActionDispatch::IntegrationTest

  test "a user can see schools on the schools_path" do
    VCR.use_cassette("DemSchools") do
      visit schools_path

      assert page.has_content?("overweight_percentage: 18.5")
      assert page.has_content?("obese_percentage: 20.8")
    end
  end

end
