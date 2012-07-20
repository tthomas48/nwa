class RemoveCompanyFromFeedItems < ActiveRecord::Migration
  def change
      remove_column :feed_items, :company_id
  end  
end
