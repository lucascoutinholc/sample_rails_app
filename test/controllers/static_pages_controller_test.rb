require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @name_app = 'Amostra App'
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get help" do
    get help_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "should get home title" do
    get root_path
    assert_select "title", "Amostra App"
  end

  test "should get help title" do
    get help_path
    assert_select "title", "Help | #{ @name_app }"
  end

  test "should get about title" do
    get about_path
    assert_select "title", "About | #{ @name_app }"
  end

  test "should get contact tile" do
    get contact_path
    assert_select "title", "Contact | #{ @name_app }"
  end

  test "should get signup title" do
    get signup_path
    assert_select "title", "Signup | #{ @name_app }"
  end
end
