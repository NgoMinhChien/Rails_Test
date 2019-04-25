class Order < ApplicationRecord
  belongs_to  :product
  validates   :product_id, presence: true
  belongs_to  :category
  validates   :category_id, presence: true
  belongs_to  :transaction
  validates   :transaction_id, presence: true
end
