class Member < ApplicationRecord
  belongs_to :band

  validates :name, presence: true
  validates :role, presence: true
end
