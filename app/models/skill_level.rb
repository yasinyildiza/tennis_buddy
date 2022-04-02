class SkillLevel < ActiveRecord::Base
	validates :name, presence: true
	validates :minimum_years, presence: true
	validates :maximum_years, presence: true
	validates :name, uniqueness: true
	validates_uniqueness_of :minimum_years, :scope => [:maximum_years]

	has_many :users, dependent: :nullify

	def full_name
		"#{name} (#{minimum_years}-#{maximum_years} years)"
	end
end
