class Live < ApplicationRecord
  has_many :live_organizations, dependent: :destroy
  belongs_to :live_house

  REGISTRABLE_ATTRIBUTES = %i(
    name
    lecture_at(1i) lecture_at(2i) lecture_at(3i)
  )

  validates :live_name,  presence: true, length: { maximum: 15 }
  validates :introduction, presence: true

  def rest_amount
    self.amount -= self.live_organizations.where(host: false).count
  end

  def start_time
    self.start_at.strftime("%Y/%m/%d(#{dw[self.start_at.wday]})")
  end

  def end_time
    self.end_at.strftime("%H:%M")
  end

end
