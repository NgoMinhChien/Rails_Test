class ProductsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	# before_action :admin,		 only: [:logged_in]
	before_action :logged_in,		 only: [:edit, :destroy]

	def new
		@products = Product.new
	end

	def index
		@products = Product.all
	end

	def show
		
	end

	def update
		if @product.update_attributes(product_params)
			flash[:success] = "Product updated!"
			redirect_to products_path
		else
			render "new"
		end
	end

	def destroy
		Product.find(params[:id]).destroy
		flash[:success] = "Product has been deleted!"
		redirect_to products_path
	end

	def create
		
	end

	private
		def set_user
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:category_id, :name, :price, :description)
		end

		def admin
				redirect_to root_path if !current_user.admin?
		end

		def logged_in
			if current_user.nil?
				redirect_to signin_path
			else
				admin
			end
		end
end
