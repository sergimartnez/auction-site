class ProductsController < ApplicationController
	
	def index
		user
	end

	def show
		product
		@bid = @product.bids.new
		if @product.deadline > Date.today
			puts "Not Closed!"
			render "show"
		else
			puts "Closed!"
			@winner = @product.get_auction_winner
			render "show_closed"
		end
	end

	def new
		user
		@product = @user.products.new
	end

	def create
		@product = user.products.new(product_params)
		if @product.save
			flash[:notice] = "Product created successfully"
			redirect_to "/users/#{user.id}/products"
		else
			flash[:alert] = @product.errors.full_messages
			render 'new'
		end
	end

	def destroy

	end

	def user
		@user = User.find_by(id: params[:user_id])
	end

	def product
		@product = user.products.find_by(id: params[:id])
	end

	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end
end
