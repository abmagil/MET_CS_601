class AddWaiterToTable < ActiveRecord::Migration
  def change
    add_column :tables, :waiter_id, :integer
  end
end
