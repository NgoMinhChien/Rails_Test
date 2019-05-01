class OrdersController < ApplicationController
	before_action :set_order, only:[:create, :show]

	def index
	end

	def show
		@order_detail = @order.order_details.find(1)
		@product 			= @order_detail.product
	end

	def create
		
	end

	private
		def set_order
			current_user = User.first
			@order = current_user.orders.find(session[:order_id])
		end
		
end
