class Public::LivesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_live_house_all, only: [:create, :new]

  def create
    @live = Live.new
    @lives = Live.where(live_house_id: params[:live][:live_house_id])

    # 1.日程が選択されているか、2.ライブスケジュールの日程が予約可能かを判断
    @live_insert = false
    @lives.each do |compare_live|
      if params[:live][:start_at].present?
        if params[:live][:start_at].between?(compare_live.start_at, compare_live.end_at)
          @live_insert = true
        end
      else
        flash.now[:danger] = "日付を選択してください"
        render :new
        return
      end
    end

    # 予約済みの日程の場合エラー、予約可能であればNew Liveをクリエイト
    if @live_insert
      flash.now[:danger] = "liveのgatherに失敗しました"
      render :new
    else
      @live = Live.new(live_params)
      @live.end_at = params[:live][:start_at]
      @live.registered_person = "band"
      if @live.save
        @user = current_user
        @live_organization = LiveOrganization.create(band_id: @user.band.id, live_id: @live.id, host: true)
        flash[:info] = 'liveをgatherしました'
        redirect_to bands_path
      else
        render :new
      end
    end
  end

  def new
    @live = Live.new
    @lives = Live.includes(:live_organization)

    respond_to do |format|
      format.html
      format.json { render :new }
    end
  end

  def show
    @live = Live.find(params[:id])

    # host
    @live_organization = LiveOrganization.find_by(live_id: @live.id, host: true)
    @live_new_organization = LiveOrganization.new
    @host_band = Band.find(@live_organization.band_id)

    # participants
    @live_organization_participants = LiveOrganization.includes(band: :user).where(live_id: @live.id, host: false)
  end

  private

  def live_params
    params.require(:live).permit(:live_image, :start_at, :end_at, :live_name, :amount, :introduction, :status, :live_house_id)
  end

  def set_live_house_all
    @live_houses = LiveHouse.all
  end
end
