require 'test_helper'

class Public::LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_lives_create_url
    assert_response :success
  end

  test "should get index" do
    get public_lives_index_url
    assert_response :success
  end

  test "should get show" do
    get public_lives_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_lives_edit_url
    assert_response :success
  end
end
