require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name:                   "",
          email:                  "user@invalid",
          password:               "12345",
          password_confirmation:  "1234"
        }
      }
    end
    assert_response :unprocessable_entity
    assert_template "users/new"
    assert_not is_logged_in?
    assert_select "div#error_explanation"
    assert_select "div.alert.alert-danger"
    assert flash.empty?
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name: "test",
          email: "test@example.com",
          password: "123test",
          password_confirmation: "123test"
        }
      }
    end
    follow_redirect!
    #assert_template "users/show"
    #assert is_logged_in?
    assert_not flash.empty?
    #assert_select "div.alert.alert-success"
  end
end
