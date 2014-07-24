class AddTitleToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
    add_index :blogs, :title
  end
end
