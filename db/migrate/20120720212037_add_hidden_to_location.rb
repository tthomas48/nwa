class AddHiddenToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :hidden, :boolean
  end
end
