class Public::LivesController < ApplicationController
  def create
    @live = Live.create(live_params)
    @user = current_user
    @live_organization = LiveOrganization.create(band_id: @user.id, live_id: @live.id)
    redirect_to bands_path
  end

  def new
    @user = current_user
    @live = Live.new
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def live_params
    params.require(:live).permit(Live::REGISTRABLE_ATTRIBUTES,:live_name,:amount,:introduction)
  end

end
