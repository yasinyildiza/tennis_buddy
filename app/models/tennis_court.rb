class TennisCourt < ActiveRecord::Base
	validates :city_id, presence: true
	validates :name, presence: true
	validates_uniqueness_of :name, :scope => [:city_id]

	belongs_to :city
	has_many :users, dependent: :nullify

	def full_name
		if city
			"#{name} (#{city.name})"
		else
			name
		end
	end
end
