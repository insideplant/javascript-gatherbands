class Public::LiveOrganizationsController < ApplicationController
  def create
    @live_organization = LiveOrganization.create(live_organization_params)
    redirect_to live_organizations_path
  end

  def new
    @user = current_user
    @live_organization = LiveOrganization.new
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def live_organization_params
    params.require(:live_organization).permit(LiveOrganization::REGISTRABLE_ATTRIBUTES,:band_id,:live_name,:amount,:organize_introduction)
  end

end
