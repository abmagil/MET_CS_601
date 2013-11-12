class AddJsToTable < ActiveRecord::Migration
  def change
    add_column :tables, :drawString, :string
  end
end
