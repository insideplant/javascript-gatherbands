class Public::BandsController < ApplicationController
  def index
    @user = current_user
    @band = current_user.band
    @live_organizations = LiveOrganization.all
    @bands = Band.all
    @members = Member.all.where(band_id: @band.id)

    @lives = Live.all

    #@live = Live.find_by(params[:live_organization][:live_id])
    #@live_organization_participants = LiveOrganization.where(host: false, live_id:@live.id)

  end

  def show
  end

  def edit
    @user = current_user
    @band = current_user.band
     #unless Member.exists?(band_id: @band.id)
        #@members = @band.members.build
     #else
        @member = @band.members
      #@new_members = @band.members.build
     #end
  end

  def update
    @band = Band.find(params[:id])
    #@member = @band.members.build
    #@member.update(member_params)
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
