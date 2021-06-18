class CategoriesController < ApplicationController
  before_action :set_admin_user, except: [:index, :show]
  before_action :get_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved successfully"
      redirect_to @category
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.save
      flash[:success] = "Category updated successfully"
      redirect_to @category
    else
      render :edit
    end
  end

  def show
    @articles = @category.articles
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = Category.find(params[:id])
  end

  def set_admin_user
    unless logged_in? && current_user.is_admin
      flash[:danger] = "Only admin users are create or update categories."
      redirect_to categories_path
    end
  end

end