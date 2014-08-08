class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
		  t.integer :replyto_id
			t.integer :replycomment_id

      t.timestamps
    end
		add_index :replies, :replyto_id
		add_index :replies, :replycomment_id
		add_index :replies, [:replyto_id, :replycomment_id], unique: true
  end
end
