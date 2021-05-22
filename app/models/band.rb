class Band < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :comments
end
