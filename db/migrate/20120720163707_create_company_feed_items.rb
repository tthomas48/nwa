class CreateCompanyFeedItems < ActiveRecord::Migration
  def change
    create_table :companies_feed_items, :id => false do |t|
      t.references :company, :null => false
      t.references :feed_item, :null => false
    end
    
    # Adding the index can massively speed up join tables. Don't use the
    # unique if you allow duplicates.
    add_index(:companies_feed_items, [:company_id, :feed_item_id], :unique => true)
  end
end
