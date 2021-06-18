require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(name: 'umang gupta', email: 'umang@example.com',
                              username: 'umanggupta', password: 'password',
                              is_admin: true)
  end

  test "create new category and show newly created category" do
    sign_in_as(@admin_user)
    get new_category_path
    assert_response :success
    assert_difference('Category.count', 1) do
      post categories_path, params: {category: {name: 'sports'}}
    end
    assert_redirected_to category_url(Category.last)
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and enter invalid submission" do
    sign_in_as(@admin_user)
    get new_category_path
    assert_response :success
    assert_no_difference('Category.count') do
      post categories_path, params: {category: {name: ''}}
    end
    assert_select 'div.alert'
    assert_match "errors", response.body
  end
end
