class Public::FavoritesController < ApplicationController
  before_action :set_article

  def create
    favorite = current_user.band.favorites.new(article_id: @article.id)
    favorite.save
    @article.create_notification_iine!(current_user.band)
  end

  def destroy
    favorite = current_user.band.favorites.find_by(article_id: @article.id)
    favorite.destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
