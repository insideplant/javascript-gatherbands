class Public::RelationshipsController < ApplicationController
  before_action :set_band, only: [:create, :destroy]

  def create
    following = current_user.band.follow(@band)
    if following.save
      flash[:info] = 'ユーザーをフォローしました'
      @band.create_notification_follow!(current_user.band)
      redirect_to mypage_path(@band)
    else
      flash.now[:danger] = 'ユーザーのフォローに失敗しました'
      redirect_to mypage_path(@band)
    end
  end

  def destroy
    following = current_user.band.unfollow(@band)
    if following.destroy
      flash[:info] = 'ユーザーのフォローを解除しました'
      redirect_to mypage_path(@band)
    else
      flash.now[:danger] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to mypage_path(@band)
    end
  end

  def followings
    @user = current_user
    @band = @user.band
    @bands = @band.followings
    @gather_bands = @band.lives
  end

  def followers
    @user = current_user
    @band = @user.band
    @bands = @band.followers
    @gather_bands = @band.lives
  end

  private

  def set_band
    @band = Band.find(params[:follow_id])
  end
end
