class CreateAliasRecords < ActiveRecord::Migration
  def change
    create_table :alias_records do |t|
      t.string :alias
      t.integer :company_id

      t.timestamps
    end
  end
end
