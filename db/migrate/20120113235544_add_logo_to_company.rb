class AddLogoToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.has_attached_file :logo
    end
  end
end
