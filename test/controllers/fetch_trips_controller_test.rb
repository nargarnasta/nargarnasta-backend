require 'test_helper'

class FetchTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fetch_trips_index_url
    assert_response :success
  end

end
