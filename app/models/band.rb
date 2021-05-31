class Band < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :members
  accepts_nested_attributes_for :members, allow_destroy: true
  has_many :live_organizations
  validates_associated :members
end
