class Live < ApplicationRecord
  has_many :live_organizations, dependent: :destroy
  belongs_to :live_house

  REGISTRABLE_ATTRIBUTES = %i(
    name
    lecture_at(1i) lecture_at(2i) lecture_at(3i)
  )

  validates :live_name,  presence: true, length: { maximum: 15 }
  validates :introduction, presence: true

end
