class Product < ApplicationRecord
  belongs_to  :category
  validates   :category_id, presence: true
  
  has_many    :order_details
  has_many    :orders, through: :order_details
end
