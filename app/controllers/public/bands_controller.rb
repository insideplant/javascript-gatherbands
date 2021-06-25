class Public::BandsController < ApplicationController
  def index
    @user = current_user
    @band = @user.band
    @live_organizations = LiveOrganization.all
    @bands = Band.all
    @members = Member.all.where(band_id: @band.id)
    @lives = Live.page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
    @band = current_user.band
    @member = @band.members
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_path
    else
      render :edit
    end
  end

  private

  def band_params
    params.require(:band).permit(:band_name,members_attributes:[:id,:role,:name,:_destroy])
  end

end
