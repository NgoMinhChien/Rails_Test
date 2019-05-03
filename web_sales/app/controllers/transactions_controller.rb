class TransactionsController < ApplicationController

	def create
		@order 			 = current_user.orders.find_by(status: "Pending")
		@transaction = current_user.transactions.create(order_id: @order.id, 
			amount: $total_cart, status: "Pending")
		
		@order.update_attributes(status: "Done")
		flash[:success] = "Hang se duoc chuyen den som"
		redirect_to root_path
	end

end
