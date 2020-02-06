json.ads @ads.each do |ad|
  json.id ad.id
  json.title ad.title
  json.content ad.content.truncate(@content_length, separator: ' ', omission: '...')
  json.background full_url(ad.background)
  json.updated_at ad.updated_at.to_i
end