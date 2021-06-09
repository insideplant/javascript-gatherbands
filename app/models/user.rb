class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :band
  accepts_nested_attributes_for :band

  validates :user_name, presence: true
  
  
  #defis_favorite?()
   # Favorite.where(host: true)
  #end
  
  #@user_1 = User.find(1)
  #@user_2 = User.find(2)
  
  #if# @user_1.is_favorite?(@user_2)
  #end

end
