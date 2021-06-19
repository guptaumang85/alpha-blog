require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest

  test "user signup successfully" do
    get signup_path
    assert_response :success
    post users_path, params: {user: {name: 'umang gupta', username: 'umang01', email: 'fvd@example.com', password: 'password'} }
    assert_redirected_to user_url(User.last.id)
    follow_redirect!
    assert_response :success
    assert_match 'successfully', response.body

  end

  test "user signup form and reject user" do
    get signup_path
    assert_response :success
    assert_no_difference "User.count" do
      post users_path, params: {user: {name: 'umang gupta', username: 'umang01', email: 'fvd', password: 'password'} }
    end
    assert_select 'div.alert-danger'
    assert_match 'following errors', response.body
  end

end
