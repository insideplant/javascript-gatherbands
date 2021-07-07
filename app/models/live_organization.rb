class LiveOrganization < ApplicationRecord
  belongs_to :band
  belongs_to :live
  has_many :notifications, dependent: :destroy
end
