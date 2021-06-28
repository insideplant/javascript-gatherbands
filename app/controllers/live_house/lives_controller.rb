class LiveHouse::LivesController < ApplicationController

  def new
    @live_houses = LiveHouse.all
    @live_house = current_live_house
    @lives = Live.where(live_house_id: @live_house.id)
    # binding.pry
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
    live = Live.new(live_params)
    binding.pry
    if live.save(registered_person: false, live_house_id: current_live_house.id, status: "live_house")
      binding.pry
      redirect_to
    else
      render :new
    end
  end

  def show
    @live = LiveHouse.find(params[:id])

  end

  private

  def live_params
    params.require(:live).permit(:start_at,:end_at, :live_name, :introduction)
  end

end
