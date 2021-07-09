class Comment < ApplicationRecord
  belongs_to :band
  belongs_to :article
  has_many :notifications, dependent: :destroy

  validates:content, presence: true, length: { maximum: 140 }
end
