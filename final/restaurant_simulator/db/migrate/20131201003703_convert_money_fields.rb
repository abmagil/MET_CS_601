class ConvertMoneyFields < ActiveRecord::Migration
  def up
  	change_column :restaurants, :cash_on_hand, :float
  	change_column :waiters, :bank_account, :float
  end

  def down
  	change_column :restaurants, :cash_on_hand, :integer
  	change_column :waiters, :bank_account, :integer
  end
end
