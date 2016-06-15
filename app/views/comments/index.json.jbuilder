json.array!(@comments) do |comment|
  json.extract! comment, :id, :summary, :content_id, :user_id, :isshow
  json.url comment_url(comment, format: :json)
end
