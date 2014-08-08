class Reply < ActiveRecord::Base
		belongs_to :replyto, class_name: "Comment"
		belongs_to :replycomment, class_name; "Comment"
		validates :replyto_id, presence: true
		validates :replycomment_id, presence: true
end
