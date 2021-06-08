class Live < ApplicationRecord
  has_many :live_organizations
  
  REGISTRABLE_ATTRIBUTES = %i(
    name
    lecture_at(1i) lecture_at(2i) lecture_at(3i)
  )
end
