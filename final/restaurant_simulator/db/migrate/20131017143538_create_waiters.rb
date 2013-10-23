class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.belongs_to :table
      t.boolean :onduty
      t.boolean :good
      t.timestamps
    end
  end
end
