class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :attachment
      t.references :blog, index: true

      t.timestamps
    end
  end
end
