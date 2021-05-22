class Public::ArticlesController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.all
    @user = User.find(current_user.id)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def new
  end

  def create
    article = Article.new(article_params)
    article.band_id = params[:article][:band_id]
    if article.save
      redirect_to articles_path(article)
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:content,:band_id)
  end

end
