class Public::BandsController < ApplicationController
  def index
    @user = current_user
    @band = current_user.band
    @bands = Band.all
    @members = Member.all.where(band_id: @band.id)
  end

  def show
  end

  def edit
    @user = current_user
    @band = current_user.band
    @member = @band.members&.first
  end


end
