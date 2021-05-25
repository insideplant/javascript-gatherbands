require 'test_helper'

class Public::LiveOrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_live_organizations_create_url
    assert_response :success
  end

  test "should get index" do
    get public_live_organizations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_live_organizations_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_live_organizations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get public_live_organizations_destroy_url
    assert_response :success
  end

end
