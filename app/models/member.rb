class Member < ApplicationRecord
  belongs_to :band

  # validates :name, presence: true, length: {maximum: 15}
  validates :role, presence: true
end
