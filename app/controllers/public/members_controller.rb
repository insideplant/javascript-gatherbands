class Public::MembersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @band = Band.find(params[:band_id])

    #@member = @band.members.build
    #@member.update(member_params)
    if @band.members.where(params[:member_id])
      @band.update(update_member_params)
    else
      @band.create(member_params)
    end
    if @band.save
      redirect_to bands_path
    else
      # error
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
