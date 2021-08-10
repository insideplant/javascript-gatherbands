class Public::HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def top
    @lives = Live.where(status: 2).limit(4)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def lives
    @lives = Live.where(status: 2).includes([:live_house]).page(params[:page]).reverse_order
    @lives_4 = Live.where(status: 2).limit(4)
  end
end
