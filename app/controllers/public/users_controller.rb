class Public::UsersController < ApplicationController
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
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        # 追加
        format.js { @status = "fail" }
      end
    end
    redirect_to mypage_path
  end

  def confirmation
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: 'default_user.png'
    )
  end

  def index
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :last_name, :first_name, :last_name_kana,
                                 :first_name_kana, :postal_code, :address, :telephone_number, :email,
                                 band_attributes: [:band_name, :id])
  end
end
