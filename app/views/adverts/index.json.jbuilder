json.array!(@adverts) do |advert|
  json.extract! advert, :id, :title, :link, :active, :advert
  json.url advert_url(advert, format: :json)
end
