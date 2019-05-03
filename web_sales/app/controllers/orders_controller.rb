class OrdersController < ApplicationController
	before_action :set_order, only:[:create, :show, :index]
	before_action :logged_in_user, only:[:create, :show, :index]

	def index
		unless @order.nil?
			@order_details 	= @order.order_details
			
			@products 	= Array.new
			@prices 		= Array.new
			@order_details.each do |order_detail|
				@products.push(order_detail.product)
				@prices.push(order_detail.product.price * order_detail.qty)
			end
			$total_cart = @prices.sum
		end
	end

	def show
	end

	def create
		
	end

	private
		def set_order
			current_user = User.first
			@order = current_user.orders.find_by(status: "Pending")
		end
		
end
