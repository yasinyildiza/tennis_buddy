json.array!(@match_sets) do |match_set|
  json.extract! match_set, :id, :user_match_id, :home_user_score, :away_user_score
  json.url match_set_url(match_set, format: :json)
end
