class Public::RelationshipsController < ApplicationController

  def create
    @band = Band.find(params[:follow_id])
    current_user.band.follow(@band)
    @band.create_notification_follow!(current_user.band)
    respond_to do |format|
      format.html { redirect_to mypage_path(@band.user) }
      format.js
    end
  end

  def destroy
    @band = Relationship.find(params[:id]).followed
    current_user.band.unfollow(@band)
    respond_to do |format|
      format.html { redirect_to mypage_path(@band.user) }
      format.js
    end
  end

  private
end
