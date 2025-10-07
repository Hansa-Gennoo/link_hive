require "test_helper"

class Dashboard::LandingPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get dashboard_landing_pages_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_landing_pages_update_url
    assert_response :success
  end
end
