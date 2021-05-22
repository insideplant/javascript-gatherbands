class Article < ApplicationRecord
  belongs_to :band
  has_many :comments
end
