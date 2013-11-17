class CreateRectTables < ActiveRecord::Migration
  def change
    create_table :rect_tables do |t|
      t.integer :height
      t.integer :width
      t.timestamps
    end
  end
end
