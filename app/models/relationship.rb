class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Band"
  belongs_to :followed, class_name: "Band"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
