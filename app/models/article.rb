class Article < ApplicationRecord
  belongs_to :band
  validates:content, presence: true, length: { maximum: 140 }
  has_many :favorites, dependent: :destroy
  has_many :comments
  has_many :notifications, dependent: :destroy

  def favorited_by?(band)
    favorites.where(band_id: band.id).exists?
  end

  def create_notification_iine!(current_band)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and article_id = ? and action = ? ", current_band.id, band_id, id, 'iine'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_band.active_notifications.new(
        article_id: id,
        visited_id: band_id,
        action: 'iine'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_band, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:band_id).where(article_id: id).where.not(band_id: current_band.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_band, comment_id, temp_id['band_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_band, comment_id, band_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_band, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_band.active_notifications.new(
      article_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
