require 'test_helper'

class StravaControllerTest < ActionDispatch::IntegrationTest
  test "should get exchange_token" do
    get strava_exchange_token_url
    assert_response :success
  end

end
