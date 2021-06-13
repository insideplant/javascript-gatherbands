class Public::LiveHousesController < ApplicationController
  def index
    @live_houses = LiveHouse.all
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end
end
