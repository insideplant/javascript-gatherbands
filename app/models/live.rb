class Live < ApplicationRecord
  has_many :live_organizations, dependent: :destroy
  belongs_to :live_house

  validates :live_name,  presence: true, length: { maximum: 15 }
  validates :introduction, presence: true

  def rest_amount
    self.amount -= self.live_organizations.where(host: false).count
  end

  def start_time
    self.start_at.strftime("%Y/%m/%d(#{dw[self.start_at.wday]})")
  end
  
  def price_per_person
    self.live_house.price /= (self.amount + 1)
  end
  
  enum status:    [ :gathering, :gathered, :waiting_live, :finish_live ]
  
end
