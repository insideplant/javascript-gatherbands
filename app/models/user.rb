class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :band
  accepts_nested_attributes_for :band

  validates :user_name, presence: true

  def current_user?(user)
    self == user
  end

  def name
    [first_name, last_name].join(' ')
  end

  def kana_name
    [first_name_kana, last_name_kana].join(' ')
  end
end
