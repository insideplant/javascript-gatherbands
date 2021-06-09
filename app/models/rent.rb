class Rent < ApplicationRecord
  belongs_to :live_house
  belongs_to :live
end
