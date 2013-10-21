class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.belongs_to :restaurant
      t.belongs_to :waiter
      t.integer :capacity
      t.timestamps
    end
  end
end
