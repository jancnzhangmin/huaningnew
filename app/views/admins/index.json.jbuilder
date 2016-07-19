json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :login, :password_digest, :auth, :status
  json.url admin_url(admin, format: :json)
end
