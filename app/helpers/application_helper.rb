module ApplicationHelper
  def converting_to_jpy(price)
    "¥#{price.to_s(:delimited)}"
  end
  
  def host_band(aaa)
    live_organization = LiveOrganization.find_by(live_id: (aaa), host: true)
    Band.find(live_organization.band_id)
  end
  
  def number_to_postal_code(number)
    "〒#{number.to_s.insert(3, "-")}"
  end
  
end
