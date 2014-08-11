class AddIndexToReviewsBlogAndUserId < ActiveRecord::Migration
  def change
			add_index :reviews, [:blog_id, :user_id], unique: true
  end
end
