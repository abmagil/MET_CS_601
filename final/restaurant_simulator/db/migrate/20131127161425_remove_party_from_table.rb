class RemovePartyFromTable < ActiveRecord::Migration
  def up
    remove_column :tables, :party_id
  end

  def down
    add_column :tables, :party_id, :integer
  end
end
