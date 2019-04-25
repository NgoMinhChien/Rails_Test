class OrdersController < ApplicationController

	def index
	end

	def show
		@product = Product.find(params[:id])
		@order	 = @product.orders
	end

end
