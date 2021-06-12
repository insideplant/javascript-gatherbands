class LiveHouse < ApplicationRecord
  has_many :rents
  attachment :image

  geocoded_by :address
  after_validation :geocode
end
