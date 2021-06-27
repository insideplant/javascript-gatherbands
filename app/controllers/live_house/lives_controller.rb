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
  
  end
  
  def show
    @live = LiveHouse.find(params[:id])
    
  end

end
