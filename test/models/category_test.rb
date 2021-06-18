class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'Sports')
  end
  
  test "Category should be valid" do
    assert @category.valid?
  end

  test "Category name should be present" do
    @category.name = ''
    assert_not @category.valid?
  end

  test "Category name should be unique" do
    @category.save
    @category_2 = Category.new(name: 'Sports')
    assert_not @category_2.valid?
  end

  test "Category name should have max length" do
    @category.name = 'a'*26
    assert_not @category.valid?
  end

  test "Category name should have minimum length" do
    @category.name = 'aa'
    assert_not @category.valid?
  end
end