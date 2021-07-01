require 'test_helper'

class Public::LiveHousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_live_houses_index_url
    assert_response :success
  end

  test "should get show" do
    get public_live_houses_show_url
    assert_response :success
  end
end
