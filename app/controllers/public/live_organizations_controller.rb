class Public::LiveOrganizationsController < ApplicationController
  def create
    @user = current_user
    LiveOrganization.create(live_organization_params)
    redirect_to bands_path
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def live_organization_params
    params.require(:live_organization).permit(:band_id, :live_id)
  end

end
