require 'test_helper'

class Public::LiveOrganaizaitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_live_organaizaitions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_live_organaizaitions_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_live_organaizaitions_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_live_organaizaitions_create_url
    assert_response :success
  end

  test "should get update" do
    get public_live_organaizaitions_update_url
    assert_response :success
  end

end
