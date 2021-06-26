class LiveHouse::LivesController < ApplicationController

  def new
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

end
