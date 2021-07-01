class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:user_name, band_attributes: [:band_name]])
  end
end
