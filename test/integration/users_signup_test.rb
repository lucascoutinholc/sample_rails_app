require "test_helper"

class UsersSignup < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end
end

class UsersSignupTest < UsersSignup
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

  test "valid signup information with account activation" do
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
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end

class AccountActivationTest < UsersSignup
  def setup
    super
    post users_path, params: {
      user: {
        name: "Usuário de exemplo",
        email: "user@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    @user = assigns(:user)
  end

  test "should not be activated" do
    assert_not @user.activated?
  end

  test "should not be able to log in before account activation" do
    log_in_as(@user)
    assert_not is_logged_in?
  end

  test "should not be able to log in with invalid activation token" do
    get edit_account_activation_path("invalid token", email: @user.email)
    assert_not is_logged_in?
  end

  test "should not be able to log in with invalid email" do
    get edit_account_activation_path(@user.activation_token, email: "wrong")
    assert_not is_logged_in?
  end

  test "should log in successfylly with valid activation token and email" do
    get edit_account_activation_path(@user.activation_token, email: @user.email)
    assert @user.reload.activated?
    follow_redirect!
    assert_template "users/show"
    assert is_logged_in?
    assert_not flash.empty?
    assert_select "div.alert.alert-success"
  end
end
