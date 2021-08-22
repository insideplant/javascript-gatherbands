class LiveHouse::LivesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_live_house!

  def new
    @live_houses = LiveHouse.all
    @live_house = current_live_house
    @lives = Live.where(live_house_id: @live_house.id)
    @live = Live.new
    respond_to do |format|
      # リクエストされるフォーマットがHTML形式の場合
      format.html
      # リクエストされるフォーマットがJSON形式の場合
      format.json { render :new }
      # @livesをjson形式のデータへ変換して返す
    end
  end

  def create
    @live_houses = LiveHouse.all
    @lives = Live.where(live_house_id: current_live_house.id)
    @live_insert = false
    @lives.each do |compare_live|
      if params[:live][:start_at].between?(compare_live.start_at, compare_live.end_at) ||
        params[:live][:end_at].between?(compare_live.start_at, compare_live.end_at)
        @live_insert = true
      end
    end

    if @live_insert
      flash.now[:danger] = "予定の作成に失敗しました"
      @live = Live.new
      render :new
    else
      live = Live.new(live_params)
      live.registered_person = false
      live.live_house_id = current_live_house.id
      live.status = "live_house"
      live.color = "gray"
      if live.save
        redirect_to live_house_schedules_path
      else
        flash.now[:danger] = "予定の作成に失敗しました"
        @live = Live.new
        render :new
      end
    end
  end

  def show
    @live = LiveHouse.find(params[:id])
  end

  private

  def live_params
    params.require(:live).permit(:start_at, :end_at, :live_name, :introduction)
  end
end
