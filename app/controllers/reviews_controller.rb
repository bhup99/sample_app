class ReviewsController < ApplicationController
  def new
  end

  def create
			@blog = Blog.find(params[:blog_id])
			@review = @blog.reviews.new(review_params)
			@review.user_id = current_user.id
			if @review.save
					flash[:success] = "Review posted!"
					redirect_to @blog
			else
					flash[:failure] = "You have already posted your review!"
					redirect_to @blog
			end
  end

  def destroy
  end

	private
		def review_params
				params.require(:review).permit(:content)
		end
end
