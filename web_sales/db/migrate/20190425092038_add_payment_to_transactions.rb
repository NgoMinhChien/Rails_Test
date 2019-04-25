class AddPaymentToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :payment, :string
    add_column :transactions, :payment_info, :string
  end
end
