class AddNameToWaiter < ActiveRecord::Migration
  def change
    add_column :waiters, :name, :string   #I can't believe I forgot this. f'n a...
  end
end
