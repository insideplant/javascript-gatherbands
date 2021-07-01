require 'test_helper'

class Admin::LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_lives_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_lives_show_url
    assert_response :success
  end
end
