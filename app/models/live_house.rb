class LiveHouse < ApplicationRecord
  has_many :lives, class_name: 'Live'
  attachment :image

  geocoded_by :address
  after_validation :geocode
end
