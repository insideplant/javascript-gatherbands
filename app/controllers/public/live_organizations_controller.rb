class Public::LiveOrganizationsController < ApplicationController
  def create
    #Liveの参加者
    @user = current_user
    LiveOrganization.create(live_organization_params)

    #Liveのマッチング完了
    @live = Live.find_by(params[:live_organization][:live_id])
    @live_organization_participants = LiveOrganization.where(host: false, live_id:@live.id)
    if @live_organization_participants.count == @live.amount
      @live.update(status: true)
      redirect_to root_path
    else
      redirect_to bands_path
    end
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
