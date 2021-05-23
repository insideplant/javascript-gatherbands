class Public::MembersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def create
    Member.create(member_params)
  end
  
    private
    def member_params
      params.require(:member).permit(:band_name,member_attributes:[:role,:name]).merge(user_id: current_user.id)
    end
end
