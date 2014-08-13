class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :reviews,  dependent: :destroy
	has_many :attachments
	has_many :ratings
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { minimum: 10 }
	validates :user_id, presence: true
	validates :title, presence: true

	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
				     WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
		      user_id: user.id)
		     
	end

	def average_rating
			ratings.sum(:score)/ratings.size
	end
end
