class Comment < ApplicationRecord
  belongs_to :band
  belongs_to :article, optional: true
  has_many :notifications, dependent: :destroy

  validates:content, presence: true, length: { maximum: 140 }
end
