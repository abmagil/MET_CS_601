class AddFieldsToParty < ActiveRecord::Migration
  def change
    add_column :parties, :table_id, :integer
    add_column :parties, :seated, :boolean
    add_column :parties, :done, :boolean
  end
end
