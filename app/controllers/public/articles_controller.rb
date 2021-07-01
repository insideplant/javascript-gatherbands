class Public::ArticlesController < ApplicationController

  def show
    @user = current_user
    @article = Article.find(params[:id])
    @new_article = Article.new
    @comments = @article.comments
    @comment = @article.comments.build

    @band = current_user.band
    #募集中のlive情報
    @gather_bands = @band.lives
  end

  def new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to mypage_path(current_user)
    else
      @user = current_user
      @articles = Article.all
      render template: "public/users/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    article = Article.find(params[:id])
    if article.delete
      redirect_to users_path(article.band.user)
    else
      render :"users/show"
    end
  end

  private

  def article_params
    params.require(:article).permit(:content, :band_id)
  end
end
