class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :cash_on_hand
      t.integer :customers_served
      t.timestamps
    end
  end
end
