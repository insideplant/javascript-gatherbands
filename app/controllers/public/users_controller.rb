class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @band = @user.band
  end

  def update
    @user = current_user
    @band = @user.band
    @user.update(user_params)
    redirect_to users_mypage_path
  end

  def confirmation
  end

  def index
    @user = User.all
  end

  private
  def user_params
    params.require(:user).permit(:user_name,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email, band_attributes:[:band_na,:id])
  end

end
