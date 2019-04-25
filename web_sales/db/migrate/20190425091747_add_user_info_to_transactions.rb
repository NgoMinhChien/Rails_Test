class AddUserInfoToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :user_name, :string
    add_column :transactions, :user_email, :string
    add_column :transactions, :user_phone, :string
  end
end
