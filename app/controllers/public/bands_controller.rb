class Public::BandsController < ApplicationController
  def index
    @user = current_user
    @band = current_user.band
    @bands = Band.all
    @mambers = Member.all.where(band_id: @band.id)
  end

  def show
  end

  def edit
    @user = current_user
    @band = current_user.band
    @member = @band.members.build
  end

  def update
  end
end
