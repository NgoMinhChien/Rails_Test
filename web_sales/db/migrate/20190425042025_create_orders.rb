class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :qty
      t.integer :amount
      t.string :status

      t.timestamps
    end
    add_index :orders, [:product_id,     :created_at]
    add_index :orders, [:transaction_id, :created_at]
    add_index :orders, [:category_id,    :created_at]
  end
end
