class Band < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :members
  has_many :favorites, dependent: :destroy

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :band

  accepts_nested_attributes_for :members, allow_destroy: true
  has_many :live_organizations
  validates_associated :members

  def follow(other_band)
    unless self == other_band
      self.relationships.find_or_create_by(follow_id: other_band.id)
    end
  end

  def unfollow(other_band)
    relationship = self.relationships.find_by(follow_id: other_band.id)
    relationship.destroy if relationship
  end

  def following?(other_band)
    self.followings.include?(other_band)
  end

end
