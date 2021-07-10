class Admin::LiveHousesController < ApplicationController
  def index
    @live_houses = LiveHouse.all
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end

  def edit
    @live_house = LiveHouse.find(params[:id])
  end

  def update
    live_house = LiveHouse.find(params[:id])
    live_house.update(live_house_params)
    redirect_to admin_live_houses_path
  end

  private

  def live_house_params
    params.require(:live_house).permit(:price, :house_name, :address, :telephone_number,
                                       :image, :detail, :postal_code, :website, :is_active)
  end
end
