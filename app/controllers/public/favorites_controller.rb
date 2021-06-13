class Public::FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favorite = current_user.band.favorites.new(article_id: @article.id)
    favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_user.band.favorites.find_by(article_id: @article.id)
    favorite.destroy
  end
end
