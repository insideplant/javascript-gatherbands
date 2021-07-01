class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      root_path
    when LiveHouse
      live_house_mypage_path(current_live_house)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path # ログアウト後に遷移するpathを設定
    else
      new_admin_session_path
    end
  end
end
