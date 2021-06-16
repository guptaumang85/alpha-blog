class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article saved successfully."
      redirect_to @article
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article updated successfully.'
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article destroyed successfully."
    end
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :description)
  end

  def require_same_user
    unless current_user == @article.user
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end
