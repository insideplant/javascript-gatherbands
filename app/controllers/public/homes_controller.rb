class Public::HomesController < ApplicationController
  def top
    @lives = Live.where(status: true)
  end

  def about
  end
end
