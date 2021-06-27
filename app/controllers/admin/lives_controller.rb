class Admin::LivesController < ApplicationController
  def index
    @lives = Live.all
  end

  def show
  end

  def update
    @live = Live.find(params[:id])
    if @live.update(satus: "waiting_live")
      redirect_to admin_lives_path
    else
      @lives = Live.all
      render :index
    end
  end

  private

  def live_params
    params.require(:live).permit(:status)
  end

end
