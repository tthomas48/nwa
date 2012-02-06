class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.string :title
      t.string :url
      t.string :content
      t.timestamp :published
      t.references :company

      t.timestamps
    end
    add_index :feed_items, :company_id
  end
end
