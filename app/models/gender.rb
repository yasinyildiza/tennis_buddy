class Gender < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true

	has_many :users, dependent: :nullify
end
