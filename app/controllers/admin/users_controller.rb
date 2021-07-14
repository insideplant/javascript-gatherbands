class Admin::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all.includes(:band)
  end

  def show
    @user = User.find(params[:id])
    @band = @user.band
    @articles = Article.where(band_id: @band.id).page(params[:page]).reverse_order
    # live情報()
    @gather_bands = @band.lives
  end
end
