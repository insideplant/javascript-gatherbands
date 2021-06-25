class Public::ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
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
  end

  private

  def article_params
    params.require(:article).permit(:content,:band_id)
  end

end
