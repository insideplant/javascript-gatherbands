class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception

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

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
