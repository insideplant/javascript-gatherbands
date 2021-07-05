class Live < ApplicationRecord
  validates :live_name, presence: true, length: { maximum: 15 }
  validates :introduction, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  attachment :live_image
  # live開催
  has_many :live_organizations, dependent: :destroy
  has_many :bands, through: :live_organizations

  belongs_to :live_house

  has_many :notifications, dependent: :destroy

  def create_notification_participant!(current_band, live_organization_id)
    # 自分以外にライブに参加している人を全て取得、全員に通知
    temp_ids = LiveOrganization.where(live_id: id).where.not(band_id: current_band.id).pluck(:band_id)
    temp_ids.each do |temp_id|
      save_notification_participant!(current_band, live_organization_id, temp_id)
    end
    # 参加者がいない場合は、hostに通知
    save_notification_participant!(current_band, live_organization_id, band_id) if temp_ids.blank?
  end

  def save_notification_participant!(current_band, live_organization_id, visited_id)
    notification = current_band.active_notifications.new(
      article_id: id,
      participate_id: live_organization_id,
      visited_id: visited_id,
      action: 'participation'
    )
    notification.save if notification.valid?
  end

  def rest_amount
    amount - live_organizations.where(host: false).count
  end

  def start_time
    dw = ["日", "月", "火", "水", "木", "金", "土"]
    start_at.strftime("%Y/%m/%d(#{dw[start_at.wday]})")
  end

  def price_per_person
    live_house.price /= (amount + 1)
  end
  # https://qiita.com/punkshiraishi/items/799bef63607e03262644
  enum status: { gathering: 0, gathered: 1, waiting_live: 2, finish_live: 3, live_house: 4 }
end
