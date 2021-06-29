json.array! @lives do |live|
  json.id live.id
  json.title live.live_name
  json.start live.start_at
  json.end live.end_at
  json.color live.color
end