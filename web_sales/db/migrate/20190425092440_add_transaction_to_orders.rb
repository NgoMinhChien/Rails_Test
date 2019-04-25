class AddTransactionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :transaction, foreign_key: true
  end
end
