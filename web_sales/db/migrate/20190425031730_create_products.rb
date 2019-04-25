class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps
    end
    add_index :products, [:category_id, :create_at]
  end
end
