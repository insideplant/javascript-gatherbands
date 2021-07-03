class Public::FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favorite = current_user.band.favorites.new(article_id: @article.id)
    favorite.save
    post.create_notification_iine!(current_user.band)
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_user.band.favorites.find_by(article_id: @article.id)
    favorite.destroy
  end
end
