class Attachment < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader, presence: true
	validates :name, presence: true
	belongs_to :blog
end
