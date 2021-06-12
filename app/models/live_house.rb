class LiveHouse < ApplicationRecord
  has_many :rents
  attachment :image
end
