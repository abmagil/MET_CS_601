class RemoveDrawStringFromTable < ActiveRecord::Migration
  def change
  	remove_column :tables, :drawString,  :string
  	add_column :tables, :type, :string
  	add_column :tables, :x, :int
  	add_column :tables, :y, :int
  end

end
