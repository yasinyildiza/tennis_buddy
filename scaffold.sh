rails g scaffold Gender name:string
rails g scaffold City name:string
rails g scaffold SkillLevel name:string minimum_years:integer maximum_years:integer
rails g scaffold TennisCourt city_id:integer name:string phone_number:string address:text
rails g scaffold TennisClub city_id:integer name:string phone_number:string address:text
rails g scaffold User email:string name:string surname:string birthday:date profile_picture:string gender_id:integer age:integer tennis_club_id:integer tennis_court_id:integer city_id:integer skill_level_id:integer about_me:text
rails g scaffold Message sender_id:integer receiver_id:integer title:string content:text
rails g scaffold Rating sender_id:integer receiver_id:integer rate:integer
rails g scaffold InvitedUser inviter_id:integer email:string
rails g scaffold UserMatch home_user_id:integer away_user_id:integer tennis_court_id:integer number_of_sets:integer
rails g scaffold MatchSet user_match_id:integer home_user_score:integer away_user_score:integer