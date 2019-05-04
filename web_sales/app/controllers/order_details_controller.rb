class OrderDetailsController < ApplicationController
	before_action :current_order, 				only: [:create, :update]
	before_action :current_order_detail, 	only: [:create, :update]

	def show
		
	end

	def update
		update_order_detail(qty_params)
	end

	def create
		if current_order_detail.nil?
			@order_details = current_order.order_details.create(product_params)
			if @order_details.save
				flash[:success] = "Add to cart success"
			else
				flash[:danger] 	= "Add to cart fail"
			end
			redirect_back_root
		else
			total = old_qty + qty_new
			update_order_detail(qty: total)
		end
	end

	def redirect_back_root
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@order = current_user.orders.find_by(status: "Pending")
		# @order.order_details.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to order_path, notice: "Deleted success." }
			format.json { head :no_content }
			format.js   { render layout: false }
		end
		# @order = current_user.orders.find_by(status: "Pending")
		# @order.order_details.find(params[:id]).destroy
		# flash[:success] = "Deleted success"
		# redirect_back(fallback_location: root_path)
	end
	
	private

		def current_order
			@order = current_user.orders.find_by(status: "Pending")
			if @order.nil?
				create_order
			else
				@order
			end
		end

		def create_order
			@order = current_user.orders.create(status: "Pending")
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

		def current_order_detail
			current_order.order_details.find_by(product_id_params)
		end

		# Get old value qty of order_detail
		def old_qty
			current_order_detail.qty
		end

		# Product is existed in cart
		# User add this product to cart
		# Get new value qty of order_detail
		def qty_new
			qty_params[:qty].to_i
		end

		def update_order_detail(qty)
			if current_order_detail.update_attributes(qty)
				flash[:success] = "Update to qty of cart success"
				redirect_back(fallback_location: root_path)
			else
				flash[:danger] 	= "Update cart fail"
				redirect_back(fallback_location: root_path)
			end
		end

end
