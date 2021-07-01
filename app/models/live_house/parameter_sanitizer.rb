class LiveHouse::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:image, :house_name, :price, :postal_code, :telephone_number, :address, :website])
  end
end
