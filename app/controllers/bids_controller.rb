class BidsController < ApplicationController
	def create	
		user = User.find_by(id: session[:current_user_id])
		@product = Product.find_by(id: params[:product_id])
		@bid = @product.bids.new(amount: params[:bid][:amount],
														 user: user)
		if @bid.save
			flash[:notice] = "Bid was inserted created successfully"
			redirect_to "/users/#{@product.user.id}/products/#{@product.id}"
		else
			flash[:alert] = @bid.errors.full_messages			
			redirect_to "/users/#{@product.user.id}/products/#{@product.id}"
		end
	end

end 
