class Public::LivesController < ApplicationController

  def index
    @live = Live.new
    @lives = Live.where(live_house_id: params[:live_house_id])
    #@lives = Live.where("start_on > ?",  6.months.since)
    #render json: [ { 'start' => 1.day.ago, 'end' => 1.day.since }]
    respond_to do |format|
      # リクエストされるフォーマットがHTML形式の場合
      format.html

      # リクエストされるフォーマットがJSON形式の場合
      format.json { render json: @lives }
      # @usersをjson形式のデータへ変換して返す
    end
  end

  def create
    @live = Live.create(live_params)
    @user = current_user
    @live_organization = LiveOrganization.create(band_id: @user.band.id, live_id: @live.id, host: true)

    redirect_to bands_path
  end

  def new
    @user = current_user
  end

  def calendar
    @lives = Live.all
  end

  def show
    @live = Live.find(params[:id])

    #host
    @live_organization = LiveOrganization.find_by(live_id: @live.id, host: true)
    @live_new_organization = LiveOrganization.new
    @host_band = Band.find(@live_organization.band_id)

    #participants
    @live_organization_participants = LiveOrganization.where(live_id: @live.id, host: false)
  end

  def update
  end

  def edit
  end

  private

  def live_params
    params.require(:live).permit(:start_at,:end_at, :live_name,:amount,:introduction, :status, :live_house_id)
  end


end
