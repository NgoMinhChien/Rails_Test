class OrderDetailsController < ApplicationController
	before_action :current_order, 	only: [:create, :update]
	before_action :current_order_detail, 	only: [:create, :update]

	def show
		
	end

	def update
		if current_order_detail.update_attributes(qty_params)
			flash[:success] = "Update to qty of cart success"
			redirect_back(fallback_location: root_path)
		else
			flash[:danger] 	= "Update cart fail"
			redirect_back(fallback_location: root_path)
		end
	end

	def create
		if current_order_detail.nil?
			@order_details = current_order.order_details.new(product_params)
			if @order_details.save
				flash[:success] = "Add to cart success"
				redirect_back(fallback_location: root_path)
			else
				flash[:danger] = "Add to cart fail"
				redirect_back(fallback_location: root_path)
			end
		else
			total = old_qty + qty_new
			if current_order_detail.update_attributes(qty: total)
				flash[:success] = "Update to qty of cart success"
				redirect_back(fallback_location: root_path)
			else
				flash[:danger] 	= "Update cart fail"
				redirect_back(fallback_location: root_path)
			end
		end
	end

	# def create
	# 	respond_to do |format|
	# 		if current_order_detail.nil?
	# 			@order_details = current_order.order_details.new(product_params)
	# 			if @order_details.save
	# 				format.html {	render category_url(1), notice: "Add to cart success" }
	# 				format.json { render :show, status: :created, location: @order_details }
	# 				# format.json { head :no_content }
	# 				format.js
	# 			else
	# 				format.json { head :no_content }
	# 				format.js
	# 			end
	# 		else
	# 			total = old_qty + qty_new
	# 			if current_order_detail.update_attributes(qty: total)
	# 				flash[:success] = "Update to qty of cart success"
	# 				redirect_back(fallback_location: root_path)
	# 			else
	# 				flash[:danger] 	= "Update cart fail"
	# 				redirect_back(fallback_location: root_path)
	# 			end
	# 		end
	# 	end
	# end

	def destroy
		@order = current_user.orders.find_by(status: "Pending")
		order_detail = @order.order_details.find(params[:id])
		respond_to do |format|
			if order_detail.destroy
				format.html { redirect_to order_details_url, notice: "Product was successfully destroyed." }
        format.json { render json: @order_details.to_json }
        format.js
			else
				format.json { render json: @order_details.to_json }
        format.js
			end
		end
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

		def old_qty
			current_order_detail.qty
		end

		def qty_new
			qty_params[:qty].to_i
		end

end
