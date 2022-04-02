class InvitedUser < ActiveRecord::Base
	validates :inviter_id, presence: true
	validates_uniqueness_of :email, :scope => [:inviter_id]
	
	belongs_to :inviter, class_name: "User", foreign_key: "inviter_id"
end
