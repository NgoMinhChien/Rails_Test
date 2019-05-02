class OrderDetailsController < ApplicationController
	before_action :current_order, 	only: [:show, :create, :update]
	before_action :check_product, 	only: [:create, :update]

	def show
		
	end

	def update
		if check_product.update_attributes(qty_params)
			flash[:success] = "Update to qty of cart success"
			redirect_back(fallback_location: root_path)
		else
			flash[:danger] 	= "Update cart fail"
			redirect_back(fallback_location: root_path)
		end
	end

	def create
		if check_product.nil?
			@order_details = current_order.order_details.create(product_params)
			if @order_details.save
				flash[:success] = "Add to cart success"
				redirect_back(fallback_location: root_path)
			else
				flash[:danger] = "Add to cart fail"
				redirect_back(fallback_location: root_path)
			end
		else
			total = old_qty + qty_new
			if check_product.update_attributes(qty: total)
				flash[:success] = "Update to qty of cart success"
				redirect_back(fallback_location: root_path)
			else
				flash[:danger] 	= "Update cart fail"
				redirect_back(fallback_location: root_path)
			end
		end
	end

	def destroy
		@order = current_user.orders.find_by(status: "Pending")
		@order.order_details.find(params[:id]).destroy
		flash[:success] = "Delete success"
		redirect_back(fallback_location: root_path)
	end
	
	private

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

		def product_params
			params.require(:order_details).permit(:product_id, :qty)
		end
		
		def qty_params
			params.require(:order_details).permit(:qty)
		end

		def product_id_params
			params.require(:order_details).permit(:product_id)
		end

		def check_product
			current_order.order_details.find_by(product_id_params)
		end

		def old_qty
			check_product.qty
		end

		def qty_new
			qty_params[:qty].to_i
		end

end
