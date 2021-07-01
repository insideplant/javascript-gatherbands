require 'test_helper'

class Public::UserBandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_user_bands_index_url
    assert_response :success
  end

  test "should get show" do
    get public_user_bands_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_user_bands_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_user_bands_update_url
    assert_response :success
  end
end
