class Article < ApplicationRecord
  belongs_to :band
  validates:band_id,presence:true, length:{ maximum: 140}
  
  has_many :comments
end
