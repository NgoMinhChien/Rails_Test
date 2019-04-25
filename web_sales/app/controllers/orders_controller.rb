class OrdersController < ApplicationController
	before_action :set_product, only:[:create, :show]

	def index
	end

	def show
		# @product = Product.find(params[:id])
		@order	 = @product.orders
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
