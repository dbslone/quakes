require 'test_helper'

class NearbyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nearby_index_url, params: { startDate: '2017-03-24', endDate: '2017-04-24' }
    assert_response :success
  end

  test "should parse csv and return results" do
    get nearby_index_url, params: { startDate: '2017-03-24', endDate: '2017-04-24' }
    assert_equal response.parsed_body.length, 8
  end
end
