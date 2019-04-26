class OrdersController < ApplicationController
	before_action :set_product, only:[:create, :show]

	def index
	end

	def show
		@order = current_user.orders.create
		@order_details = @order.order_details.create(product_id: @product.id, qty: 2)
	end

	def create
		
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def order_params
			params.require(:order).permit(:product_id, :price, :qty, :amount)
		end
end
