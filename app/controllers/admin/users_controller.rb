class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @band = @user.band
    @articles = Article.where(band_id: @band.id).page(params[:page]).reverse_order
    # live情報()
    @gather_bands = @band.lives
  end

  def edit
  end

  def update
  end
end
