class Comment < ActiveRecord::Base
  belongs_to :blog
	has_many :replies, foreign_key: "replyto_id", dependent: :destroy
	has_many :replycomments, through: :replies

	def reply!(other_comment)
			comments.create!(replycomment_id: other_comment.id)
	end

	def unreply!(other_comment)
			comments.find_by(replycomment_id: other_comment.id).destroy
	end


end
