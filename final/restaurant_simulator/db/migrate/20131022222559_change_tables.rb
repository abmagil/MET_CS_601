class ChangeTables < ActiveRecord::Migration
  def up
    change_column :tables, :name, :string, :null => false
  end

  def down
    change_column :tables, :name, :string, :null => true
  end
end
