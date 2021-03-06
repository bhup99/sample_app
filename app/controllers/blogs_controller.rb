class BlogsController < ApplicationController
	before_action :signed_in_user,	only: [:create, :destroy, :show]
	before_action :correct_user, 	only: :destroy

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

	def share(blog)
			@blog = current_user.blogs.build(content: blog.content)
			if @blog.save
					flash[:success] = "Blog create!"
			else
					flash[:failure] = "Fail to share blog!"
			end
	end

	def destroy
		@blog.destroy
		redirect_to root_url
	end
	
	def show
		@blog = Blog.find(params[:id])
		blog_in @blog
		@rating = Rating.where(blog_id: @blog.id, user_id: current_user.id).first unless @rating
		@rating = Rating.create(blog_id: @blog.id, user_id: current_user.id, score: 0)
		@comments = @blog.comments.all
		@attachments = @blog.attachments.all
		@attachment = @blog.attachments.build
		@reviews = @blog.reviews.all

	end


	private

	def blog_params
		params.require(:blog).permit(:title, :content)
	end

	def correct_user
		@blog = Blog.find_by(id: params[:id])
		redirect_to root_url unless current_user?(@blog.user)
	end
end
