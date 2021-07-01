require 'test_helper'

class Admin::UserBandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_bands_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_bands_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_user_bands_update_url
    assert_response :success
  end
end
