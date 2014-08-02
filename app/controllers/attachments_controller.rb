class AttachmentsController < ApplicationController
  require 'json'

  def create
		@current_blog = params[:attachment][:blog].to_i
		@current_blog = Blog.find(@current_blog)
	  @attachment = @current_blog.attachments.new(attachment_params)
	  if @attachment.save
				redirect_to @current_blog, notice: "The attachment #{@attachment.name} has been uploaded."
	  else
		  redirect_to @current_blog
	  end
  end

  def destroy
	  @attachment = Attachment.find(params[:id])
		current_blog = @attachment.blog
	  @attachment.destroy
	  redirect_to current_blog, notice: "The attachment #{@attachment.name} has been deleted."
  end

  private

  def attachment_params
	  params.require(:attachment).permit(:name, :attachment)
  end

end
