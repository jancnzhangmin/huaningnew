json.array!(@clas) do |cla|
  json.extract! cla, :id, :title, :keyword
  json.url cla_url(cla, format: :json)
end
