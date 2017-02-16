class Product < ApplicationRecord
	belongs_to :user
	has_many	 :bids

	def get_highest_bid_amount
		if bids.first.id != nil
			bids.order("amount DESC").first.amount
		else
			0
		end
	end
	def get_auction_winner
		if bids.first.id != nil
			bids.order("amount DESC").first.user.name
		else
			nil
		end
	end
end
