class AddIndexToBlogsTitleUserId < ActiveRecord::Migration
  def change
			add_index :blogs, [:user_id, :title], unique: true
  end
end
