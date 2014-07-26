class BlogsController < ApplicationController
	before_action :signed_in_user,	only: [:create, :destroy, :show]
	before_action :correct_user, 	only: :destroy
	before_action :User.current=Blog.find(params[:id]),		only: :show

	def create
		@blog = current_user.blogs.build(blog_params)
		if @blog.save
			flash[:success] = "Blog created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@blog.destroy
		redirect_to root_url
	end
	
	def show
		@blog = Blog.find(params[:id])
		@comments = @blog.comments.all
		@attachments = @blog.attachments.all
		@attachment = @blog.attachments.new
	end

	def self.current
		@current_blog
	end

	private

	def self.current= (b)
		@current_blog = b
	end

	def blog_params
		params.require(:blog).permit(:title, :content)
	end

	def correct_user
		@blog = Blog.find_by(id: params[:id])
		redirect_to root_url unless current_user?(@blog.user)
	end
end
