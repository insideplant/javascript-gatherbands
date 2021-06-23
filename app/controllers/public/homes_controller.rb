class Public::HomesController < ApplicationController
  def top
    @lives = Live.where(status: 1)
  end

  def about
  end
end
