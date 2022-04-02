class UserMatch < ActiveRecord::Base
	validates :home_user_id, presence: true
	validates :away_user_id, presence: true
	validates :number_of_sets, presence: true

	belongs_to :tennis_court
	belongs_to :home_user, class_name: "User", foreign_key: "home_user_id"
	belongs_to :away_user, class_name: "User", foreign_key: "away_user_id"

	has_many :match_sets, dependent: :destroy

	def is_completed
		if home_user_score > (number_of_sets / 2) or away_user_score > (number_of_sets / 2)
			return true
		end
		return false
	end

	def home_user_score
		total_score = 0
		match_sets.each do |match_set|
			if match_set.winner_user == home_user
				total_score += 1
			end
		end
		total_score
	end

	def away_user_score
		total_score = 0
		match_sets.each do |match_set|
			if match_set.winner_user == away_user
				total_score += 1
			end
		end
		total_score
	end

	def what_is_my_score(user)
		if user == home_user
			return home_user_score
		elsif  user == away_user
			return away_user_score
		end
		return 0
	end

	def home_user_sets_won
		return home_user_score
	end

	def away_user_sets_won
		return away_user_score
	end

	def home_user_sets_lost
		return away_user_sets_won
	end

	def away_user_sets_lost
		return home_user_sets_won
	end

	def what_is_my_sets_won(user)
		if user == home_user
			return home_user_sets_won
		elsif  user == away_user
			return away_user_sets_won
		end
		return 0
	end

	def what_is_my_sets_lost(user)
		if user == home_user
			return home_user_sets_lost
		elsif  user == away_user
			return away_user_sets_lost
		end
		return 0
	end

	def home_user_games_won
		total_score = 0
		match_sets.each do |match_set|
			total_score += match_set.home_user_score
		end
		total_score
	end

	def away_user_games_won
		total_score = 0
		match_sets.each do |match_set|
			total_score += match_set.away_user_score
		end
		total_score
	end

	def home_user_games_lost
		return away_user_games_won
	end

	def away_user_games_lost
		return home_user_games_won
	end

	def what_is_my_games_won(user)
		if user == home_user
			return home_user_games_won
		elsif user == away_user
			return away_user_games_won
		end
		return 0
	end

	def what_is_my_games_lost(user)
		if user == home_user
			return home_user_games_lost
		elsif user == away_user
			return away_user_games_lost
		end
		return 0
	end

	def winner_user
		unless is_completed
			return nil
		end
		if away_user_score > home_user_score
			return away_user
		end
		return home_user
	end

	def loser_user
		unless is_completed
			return nil
		end
		if away_user_score < home_user_score
			return away_user
		end
		return home_user
	end

	def am_i_winner(user)
		return user == winner_user
	end

	def am_i_loser(user)
		return user == loser_user
	end
end
