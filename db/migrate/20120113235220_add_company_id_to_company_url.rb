class AddCompanyIdToCompanyUrl < ActiveRecord::Migration
  def change
    add_column :company_urls, :company_id, :integer
  end
end
