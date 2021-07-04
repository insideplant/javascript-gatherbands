class Live < ApplicationRecord
  attachment :live_image
  # live開催
  has_many :live_organizations, dependent: :destroy
  has_many :bands, through: :live_organizations

  belongs_to :live_house

  validates :live_name, presence: true, length: { maximum: 15 }
  validates :introduction, presence: true

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
