require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @name_app = 'Amostra App'
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get home title" do
    get static_pages_home_url
    assert_select "title", "Home | #{ @name_app }"
  end

  test "should get help title" do
    get static_pages_help_url
    assert_select "title", "Help | #{ @name_app }"
  end

  test "should get about title" do
    get static_pages_about_url
    assert_select "title", "About | #{ @name_app }"
  end
end
