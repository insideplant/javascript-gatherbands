module ApplicationHelper
  def converting_to_jpy(price)
    "¥#{price.to_s(:delimited)}"
  end

  def host_band(type)
    live_organization = LiveOrganization.find_by(live_id: type, host: true)
    Band.find(live_organization.band_id)
  end

  def number_to_postal_code(number)
    "〒#{number.to_s.insert(3, "-")}"
  end

  def live_participate?(band, live_participants)
    live_participants.where(band_id: band)
  end
end
