class User < ActiveRecord::Base 
	validates :email, presence: true
	validates :name, presence: true
	validates :surname, presence: true
	validates :gender_id, presence: true
	validates :city_id, presence: true
	validates :skill_level_id, presence: true
	validates :email, uniqueness: true

	devise :database_authenticatable,
		:recoverable,
		:rememberable,
		:trackable,
		:validatable,
		:timeoutable,
		:timeout_in => 30.minutes

	validates :password_confirmation, presence: true, on: :create
	validates :password, presence: true,
		length: {:minimum => 1, :maximum => 30},
		confirmation: true,
		on: :create

	belongs_to :gender
	belongs_to :city
	belongs_to :skill_level
	belongs_to :tennis_club
	belongs_to :tennis_court

	has_many :sent_messages, class_name: "Message", foreign_key: :sender_id, dependent: :destroy
	has_many :received_messages, class_name: "Message", foreign_key: :receiver_id, dependent: :destroy

	has_many :sent_ratings, class_name: "Rating", foreign_key: :sender_id, dependent: :destroy
	has_many :received_ratings, class_name: "Rating", foreign_key: :receiver_id, dependent: :destroy

	has_many :home_matches, class_name: "UserMatch", foreign_key: :home_user_id, dependent: :destroy
	has_many :away_matches, class_name: "UserMatch", foreign_key: :away_user_id, dependent: :destroy

	has_many :invited_users, foreign_key: :inviter_id, dependent: :destroy

	mount_uploader :profile_picture, ImageUploader

	def full_name
		"#{name} #{surname}"
	end

	def average_rating
		all_ratings = Rating.where(receiver_id: id)
		number_of_ratings = all_ratings.count
		if number_of_ratings == 0
			return "No rating"
		end
		total_ratings = 0
		all_ratings.each do |rating|
			total_ratings += rating.rate
		end
		return total_ratings / number_of_ratings
	end

	def all_matches
		home_matches + away_matches
	end

	def matches_won
		total_matches = []
		all_matches.each do |user_match|
			if user_match.am_i_winner(self)
				total_matches << user_match
			end
		end
		total_matches
	end

	def matches_lost
		total_matches = []
		all_matches.each do |user_match|
			if user_match.am_i_loser(self)
				total_matches << user_match
			end
		end
		total_matches
	end

	def sets_won
		total_score = 0
		all_matches.each do |user_match|
			total_score += user_match.what_is_my_sets_won(self)
		end
		total_score
	end

	def sets_lost
		total_score = 0
		all_matches.each do |user_match|
			total_score += user_match.what_is_my_sets_lost(self)
		end
		total_score
	end

	def games_won
		total_score = 0
		all_matches.each do |user_match|
			total_score += user_match.what_is_my_games_won(self)
		end
		total_score
	end

	def games_lost
		total_score = 0
		all_matches.each do |user_match|
			total_score += user_match.what_is_my_games_lost(self)
		end
		total_score
	end
end
