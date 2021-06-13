class Admin::LiveHousesController < ApplicationController
  def index
    @live_houses = LiveHouse.all
  end

  def show
    @live_house = LiveHouse.find(params[:id])
    #gon.latitude = @live_house.latitude
    #gon.longitude = @live_house
  end

  def new
    @new_live_house = LiveHouse.new
  end

  def create
    live_house = LiveHouse.new(live_house_params)
    live_house.save
    redirect_to admin_live_houses_path
  end

  private
  def live_house_params
    params.require(:live_house).permit(:price, :house_name, :address, :telephone_number, :image, :detail, :postal_code, :website)
  end

end
