class AddPartyToTable < ActiveRecord::Migration
  def change
    add_column :tables, :party_id, :integer
  end
end
