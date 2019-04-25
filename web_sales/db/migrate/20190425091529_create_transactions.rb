class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.integer :amount
      t.string :message

      t.timestamps
    end
    add_index :transactions, [:user_id, :create_at]
  end
end
