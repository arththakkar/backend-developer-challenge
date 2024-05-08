require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:arth) # Using fixtures
  end

  test "should login user with valid credentials" do
    post sessions_login_url, params: { username: @user.username, password: 'secret' }
    assert_response :success
    assert json = JSON.parse(response.body)
    assert_equal @user.id, json['user']['id']
  end

  test "should not login user with invalid credentials" do
    post sessions_login_url, params: { username: @user.username, password: 'wrong' }
    assert_response :unauthorized
    assert json = JSON.parse(response.body)
    assert_includes json['errors'], 'Invalid username or password'
  end

  test "should register new user" do
    assert_difference 'User.count', 1 do
      post sessions_register_url, params: { user: { username: 'newuser', password: 'newpassword', password_confirmation: 'newpassword' } }
    end
    assert_response :created
    assert json = JSON.parse(response.body)
    assert json['user']['username'], 'newuser'
  end

  test "should not register new user with invalid data" do
    post sessions_register_url, params: { user: { username: '', password: 'password', password_confirmation: 'password' } }
    assert_response :unauthorized
    assert json = JSON.parse(response.body)
    assert_includes json['errors'], "Username can't be blank"
  end

  test "should logout user" do
    delete sessions_logout_url, params: { authentication_token: @user.authentication_token }
    assert_response :ok
  end

  private

  # Helper method to parse JSON responses
  def json_response
    JSON.parse(response.body)
  end
end
