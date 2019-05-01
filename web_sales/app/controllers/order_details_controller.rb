class OrderDetailsController < ApplicationController
	before_action :set_user, 			only: [:show, :edit, :update, :create]
	before_action :current_order, only: [:show, :create]

	def show
		
	end

	def create
		@order_details = current_order.order_details.create(product_id: 2, qty: 1)
		flash[:success] = "Đã thêm sản phẩm vào giỏ hàng"
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@order = current_user.orders.find_by(status: "Pending")
		@order.order_details.find(params[:id]).destroy
		flash[:success] = "Delete success"
		redirect_back(fallback_location: root_path)
	end
	
	private
		def set_user
			@product = Product.find(1)
		end

		def current_order
			if session[:order_id].nil?
				create_order
			else
				@order = Order.find(session[:order_id])
				if @order
					if @order.status != "Pending"
						create_order
					else
						@order
					end
				end
			end
		end

		def create_order
			@order = current_user.orders.create(status: "Pending")
			session[:order_id] = @order.id
		end
		
end
