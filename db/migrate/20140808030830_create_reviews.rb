class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :blog, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
