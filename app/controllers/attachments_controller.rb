class AttachmentsController < ApplicationController
  def create

	  @attachment = Blog.current.attachments.new(attachment_params)

	  if @attachment.save
		  redirect_to Blog.current, notice: "The attachment #{@attachment.name} has been uploaded."
	  else
		  render "new"
	  end
  end

  def destroy
	  @attachment = Attachment.find(params[:id])
	  @attachment.destroy
	  redirect_to Blog.current, notice: "The attachment #{@attachment.name} has been deleted."
  end

  def new
	  @attachment = Blog.current.attachment.new
  end

  private

  def attachment_params
	  params.require(:attachment).permit(:name, :attachment)
  end

end
