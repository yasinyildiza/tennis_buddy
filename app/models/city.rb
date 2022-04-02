class City < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true

	has_many :tennis_courts, dependent: :nullify
	has_many :tennis_clubs, dependent: :nullify
	has_many :users, dependent: :nullify
end
