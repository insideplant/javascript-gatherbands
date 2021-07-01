class Article < ApplicationRecord
  belongs_to :band
  validates:content, presence: true, length: { maximum: 140 }
  has_many :favorites, dependent: :destroy
  has_many :comments

  def favorited_by?(band)
    favorites.where(band_id: band.id).exists?
  end
end
