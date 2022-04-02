json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :surname, :birthday, :profile_picture, :gender_id, :age, :tennis_club_id, :city_id, :skill_level_id, :about_me
  json.url user_url(user, format: :json)
end
