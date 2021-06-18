class Relationship < ApplicationRecord
  belongs_to :band
  belongs_to :follow, class_name: "Band"

  validates :band_id, presence: true
  validates :follow_id, presence: true
end
