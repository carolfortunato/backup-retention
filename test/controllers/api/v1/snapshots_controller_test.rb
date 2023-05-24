require 'test_helper'

class Api::V1::SnapshotsControllerTest < ActionDispatch::IntegrationTest
  test "should get should_retain" do
    get api_v1_snapshots_should_retain_url
    assert_response :success
  end

end
