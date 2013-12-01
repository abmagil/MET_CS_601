class AddBankAccountToWaiter < ActiveRecord::Migration
  def change
    add_column :waiters, :bank_account, :integer, default: 100
  end
end
