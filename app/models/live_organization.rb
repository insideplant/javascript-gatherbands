class LiveOrganization < ApplicationRecord
  belongs_to :band
  belongs_to :live, optional: true

  REGISTRABLE_ATTRIBUTES = %i(
    name
    lecture_at(1i) lecture_at(2i) lecture_at(3i)
  )
end
