class LiveHouse::ScadulesController < ApplicationController
  def index
    @lives = Live.all
  end


  def show
  end

end
