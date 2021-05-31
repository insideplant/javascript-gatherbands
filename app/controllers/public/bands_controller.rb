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
    unless Member.exists?(band_id: @band.id)
      @members = @band.members.build
    else
      @members = @band.members
    end
  end
  
  def update
    @band = Band.find(params[:id])
    #@member = @band.members.build
    #@member.update(member_params)
    if @band.members
      @band.update(update_member_params)
    else
      @band.create(member_params)
    end
    if @band.save
      redirect_to bands_path
    end
  end
  
  private

  def member_params
    params.require(:band).permit(:band_name,members_attributes:[:role,:name])
  end

  def update_member_params
    params.require(:band).permit(:band_name,members_attributes:[:role,:name,:id])
  end

end
