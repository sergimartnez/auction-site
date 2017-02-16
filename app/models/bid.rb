class Bid < ApplicationRecord
	belongs_to :product
	belongs_to :user
	attr_accessor :email_address
	validate :bid_amount_cannot_be_lower_to_minimum_price,
		:bid_amount_cannot_be_lower_to_previous_highest_bid,
		:bid_creator_cannot_be_product_owner
		
	def bid_creator_cannot_be_product_owner
		if user == product.user
			errors.add(:user, "can't be the Product owner")
		end
	end

	def bid_amount_cannot_be_lower_to_minimum_price
		if amount <= product.minimum_bid
			errors.add(:amount, "can't be lower than the minimum bid established")
		end
	end

	def bid_amount_cannot_be_lower_to_previous_highest_bid
		
		if amount <= product.get_highest_bid_amount
			errors.add(:amount, "can't be lower than highest previous bid")
		end
	end
end
