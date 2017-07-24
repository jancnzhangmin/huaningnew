json.array!(@contents) do |content|
  json.extract! content, :id, :title, :summary, :content, :cla_id, :visit
  json.url content_url(content, format: :json)
end
