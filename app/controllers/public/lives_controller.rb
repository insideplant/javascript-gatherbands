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
      format.json { render json: [{id: Lives.id, start: @lives.start_at, end: @lives.end_at}] }
      # @usersをjson形式のデータへ変換して返す
    end
  end

  def create
    @live = Live.create(live_params)
    @user = current_user
    @live_organization = LiveOrganization.create(band_id: @user.band.id, live_id: @live.id, host: true)
    binding.pry
    redirect_to bands_path
    
  end

  def new
    #gon.live_house_id = params[:id]
    @live_houses = LiveHouse.all
    @live = Live.new

    respond_to do |format|
      # リクエストされるフォーマットがHTML形式の場合
      format.html

      # リクエストされるフォーマットがJSON形式の場合
      format.json { render :new }
      # @livesをjson形式のデータへ変換して返す
    end
  end
  
  def selecthouse
  
  end

  def calendar
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
