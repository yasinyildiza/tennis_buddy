class MatchSet < ActiveRecord::Base
	validates :user_match_id, presence: true

	belongs_to :user_match

	def winner_user
		if away_user_score > home_user_score
			return user_match.away_user
		end
		return user_match.home_user
	end
end
