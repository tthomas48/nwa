class CreateCompanyUrls < ActiveRecord::Migration
  def change
    create_table :company_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
