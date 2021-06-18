require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
  end
  
  test "Listing all categories" do
    get categories_path
    assert_response :success
    assert_select "a[href=?]", category_path(@category), text: @category.name
  end


end
