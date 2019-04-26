class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      # t.references :order, foreign_key: true
      # t.references :product, foreign_key: true
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer    :qty

      t.timestamps
    end
  end
end
