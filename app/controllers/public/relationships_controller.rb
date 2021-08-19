class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: [:followings, :followers]

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:info] = 'ユーザーをフォローしました'
    redirect_to user # mypage_path(@band)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash.now[:danger] = 'ユーザーのフォロー解除に失敗しました'
    redirect_to user # redirect_to mypage_path(@band)
  end

  def following
    @band = @user.band
    @bands = @band.followings
    @gather_bands = @band.lives
  end

  def followers
    @band = @user.band
    @bands = @band.followers
    @gather_bands = @band.lives
  end

  private

  def set_band
    @band = Band.find(params[:follow_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
