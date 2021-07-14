class Admin::LiveHousesController < ApplicationController
  before_action :set_live_house, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @live_houses = LiveHouse.all
  end

  def show
  end

  def edit
  end

  def update
    @live_house.update(live_house_params)
    redirect_to admin_live_houses_path
  end

  private

  def live_house_params
    params.require(:live_house).permit(:price, :house_name, :address, :telephone_number,
                                       :image, :detail, :postal_code, :website, :is_active)
  end

  def set_live_house
    @live_house = LiveHouse.find(params[:id])
  end
end
