class Band < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :comments
  has_many :members
end
