class LiveHouse < ApplicationRecord
  has_many :lives
  attachment :image

  geocoded_by :address
  after_validation :geocode
end
