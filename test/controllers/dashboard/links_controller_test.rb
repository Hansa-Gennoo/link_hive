require "test_helper"

class Dashboard::LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_links_index_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_links_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_links_create_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_links_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_links_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_links_destroy_url
    assert_response :success
  end
end
