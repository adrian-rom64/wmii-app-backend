json.ad do
  json.id @ad.id
  json.title @ad.title
  json.content @ad.content
  json.background full_url(@ad.background)
  json.updated_at @ad.updated_at.to_i
  json.created_at @ad.created_at.to_i
end