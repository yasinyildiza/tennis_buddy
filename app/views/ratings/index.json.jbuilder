json.array!(@ratings) do |rating|
  json.extract! rating, :id, :sender_id, :receiver_id, :rate
  json.url rating_url(rating, format: :json)
end
