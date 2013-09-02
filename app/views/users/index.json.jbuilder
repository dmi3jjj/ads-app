json.array!(@users) do |user|
  json.extract! user, :phone
  json.url user_url(user, format: :json)
end
