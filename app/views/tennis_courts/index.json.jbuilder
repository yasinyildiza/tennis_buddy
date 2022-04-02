json.array!(@tennis_courts) do |tennis_court|
  json.extract! tennis_court, :id, :city_id, :name, :phone_number, :address
  json.url tennis_court_url(tennis_court, format: :json)
end
