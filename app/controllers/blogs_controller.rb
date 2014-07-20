class BlogsController < ApplicationController
	before_action :signed_in_user,	only: [:create, :destroy]
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

	def destroy
		@blog.destroy
		redirect_to root_url
	end

	private

	def blog_params
		params.require(:blog).permit(:content)
	end

	def correct_user
		@blog = Blog.find_by(id: params[:id])
		redirect_to root_url unless current_user?(@blog.user)
	end

end
