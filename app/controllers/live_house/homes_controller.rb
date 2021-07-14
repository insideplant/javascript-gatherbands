class LiveHouse::HomesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_live_house!

  def top
  end
end
