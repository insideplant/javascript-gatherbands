class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :lives]

  add_flash_types :success, :info, :warning, :danger

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      root_path
    when LiveHouse
      live_house_mypage_path(current_live_house)
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      root_path
    when LiveHouse
      live_house_mypage_path(current_live_house)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
