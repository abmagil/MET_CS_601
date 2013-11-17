class AddShapeFieldsToTable < ActiveRecord::Migration
  def change
  	add_column :tables, :width, :integer
  	add_column :tables, :height, :integer
  	add_column :tables, :radius, :integer
  end
end
