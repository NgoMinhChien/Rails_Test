class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # has_many :order
  # has_many :product
end
