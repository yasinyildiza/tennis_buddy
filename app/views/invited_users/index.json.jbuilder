json.array!(@invited_users) do |invited_user|
  json.extract! invited_user, :id, :inviter_id, :email
  json.url invited_user_url(invited_user, format: :json)
end
