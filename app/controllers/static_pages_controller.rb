class StaticPagesController < ApplicationController

  def home
	  if signed_in?
		  @blog = current_user.blogs.build if signed_in?
		  @feed_items = current_user.feed.paginate(page: params[:page])
	  end
  end

  def help
  end

  def about
  end

  def contact 
  end
end
