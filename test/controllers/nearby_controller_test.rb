require 'test_helper'

class NearbyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nearby_index_url
    assert_response :success
  end

end
