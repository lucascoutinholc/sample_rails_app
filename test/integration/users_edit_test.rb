require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lucas)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: {
      user: {
        name: "",
        email: "lucas@example",
        password: "123",
        password_confirmation: ""
      }
    }
    assert_response :unprocessable_entity
    assert_template "users/edit"
    assert_select "div.alert", "O formulário contém 4 erros"
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: {
      user: {
        name: "John",
        email: "johndoe@example.com",
        password: "",
        password_confirmation: ""
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal "John", @user.name
    assert_equal "johndoe@example.com", @user.email
  end
end
