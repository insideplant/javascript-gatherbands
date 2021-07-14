class LiveHouse::ScadulesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_live_house!

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
end
