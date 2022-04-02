json.array!(@user_matches) do |user_match|
  json.extract! user_match, :id, :home_user_id, :away_user_id, :tennis_court_id
  json.url user_match_url(user_match, format: :json)
end
