class RatingsController < ApplicationController

  def update

			@rating = Rating.find(params[:id])
			@blog = @rating.blog

			if @rating.update_attributes(score: params[:score])
					respond_to do |format|
							format.js
					end
			end
  end
end
