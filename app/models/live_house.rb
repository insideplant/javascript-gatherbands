class LiveHouse < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lives, class_name: 'Live'
  attachment :image

  geocoded_by :address
  after_validation :geocode
end
