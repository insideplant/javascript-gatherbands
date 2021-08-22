class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @band = @user.band
    @article = Article.new
    @articles = Article.includes(band: :user).page(params[:page]).reverse_order
    # live情報
    @gather_bands = @band.lives
  end

  def edit
    @user = current_user
    @band = @user.band
  end

  def update
    @user = current_user
    @band = @user.band

    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "プロフィール情報を更新しました。"
        format.js { render js: "window.location='#{mypage_path(@user)}'" }
      else
        format.js { render :errors }
      end
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: 'default_user.png'
    )
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @band = @user.band
    @gather_bands = @band.lives
    @users = @user.following.page(params[:page])
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @band = @user.band
    @gather_bands = @band.lives
    @users = @user.followers.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :last_name, :first_name, :last_name_kana,
                                 :first_name_kana, :postal_code, :address, :telephone_number, :email,
                                 band_attributes: [:band_name, :id])
  end
end
