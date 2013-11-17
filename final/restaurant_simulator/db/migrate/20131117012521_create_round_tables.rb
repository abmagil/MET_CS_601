class CreateRoundTables < ActiveRecord::Migration
  def change
    create_table :round_tables do |t|
      t.integer :radius
      t.timestamps
    end
  end
end
