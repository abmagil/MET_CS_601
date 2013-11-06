class AddOccupiedToTables < ActiveRecord::Migration
  def change
    add_column :tables, :occupied, :boolean
  end
end
