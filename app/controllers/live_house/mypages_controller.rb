class LiveHouse::MypagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_live_house!

  def show
    @live_house = LiveHouse.find(params[:id])
    @live = Live.new
    @lives = Live.where(live_house_id: params[:id])

    respond_to do |format|
      # リクエストされるフォーマットがHTML形式の場合
      format.html

      # リクエストされるフォーマットがJSON形式の場合
      format.json { render :show }
      # @livesをjson形式のデータへ変換して返す
    end
  end

  def edit
  end
end
