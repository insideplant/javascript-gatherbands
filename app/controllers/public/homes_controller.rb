class Public::HomesController < ApplicationController
  def top
    @lives = Live.where(status: 2).limit(4)
  end

  def lives
    @lives = Live.where(status: 2).includes([:live_house]).page(params[:page]).reverse_order
    @lives_4 = Live.where(status: 2).limit(4)
  end
end
