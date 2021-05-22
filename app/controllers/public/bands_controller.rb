class Public::BandsController < ApplicationController
  def index
    @bands = UserBand.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
