json.array!(@tennis_clubs) do |tennis_club|
  json.extract! tennis_club, :id, :city_id, :name, :phone_number, :address
  json.url tennis_club_url(tennis_club, format: :json)
end
