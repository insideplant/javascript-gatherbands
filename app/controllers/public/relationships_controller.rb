class Public::RelationshipsController < ApplicationController
  before_action :set_band

  def create
    following = current_user.band.follow(@band)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
    redirect_to @band
    else
    flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    redirect_to @band
    end
  end

  def destroy
    following = current_user.band.unfollow(@band)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @band
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @band
    end
  end

  private

  def set_band
    @band = Band.find(params[:relationship][:follow_id])
  end

end
