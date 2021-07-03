class Band < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :members
  has_many :favorites, dependent: :destroy

  # follow機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :band

  # live開催
  has_many :live_organizations
  has_many :lives, through: :live_organizations, source: :live

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # band情報とmember情報を同時にcreate
  accepts_nested_attributes_for :members, allow_destroy: true

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
  
  def create_notification_follow!(current_band)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_band.id, id, 'follow'])
    if temp.blank?
      notification = current_band.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
