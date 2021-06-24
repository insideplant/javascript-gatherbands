class Admin::LivesController < ApplicationController
  def index
    @lives = Live.all
  end

  def show
  end
end
