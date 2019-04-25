class AddFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :view,    :integer
    add_column :products, :rating,  :decimal
  end
end
