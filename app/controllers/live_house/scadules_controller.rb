class LiveHouse::ScadulesController < ApplicationController
  def index
    @lives = Live.all
    @band_lives = Live.where(registered_person: true)
    respond_to do |format|
      # リクエストされるフォーマットがHTML形式の場合
      format.html

      # リクエストされるフォーマットがJSON形式の場合
      format.json { render :new }
      # @livesをjson形式のデータへ変換して返す
    end
  end


  def show
  end

end
