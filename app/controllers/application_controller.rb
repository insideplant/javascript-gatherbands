class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   case resource
   when Admin
     admin_root_path
   when User
     root_path
   end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path# ログアウト後に遷移するpathを設定
    else
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [[:user_name],band_attributes: [:band_name] ])
  end

end
