class ApplicationController < ActionController::Base

 #before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
   case resource
   when Admin
     admin_root_path
   when User
     root_path
   when LiveHouse
     live_house_root_path
   end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path# ログアウト後に遷移するpathを設定
    else
      new_admin_session_path
    end
  end

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [[:user_name],band_attributes: [:band_name] ])
  # end

  #def configure_permitted_parameters
  #  binding.pry
  #  if resource_class == User
  #    User::ParameterSanitizer.new(User, :user, params)
  #  else
  #    LiveHouse::ParameterSanitizer.new(LiveHouse, :live_house, params)
  #    # super # Use the default one
  #  end
  #end

end
