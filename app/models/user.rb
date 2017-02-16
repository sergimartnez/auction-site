class User < ApplicationRecord
	has_many 	:products
	has_many 	:bids
	validates :email_address, presence: true
	validates :email_address, uniqueness: true
	def self.get_user email, pass
		self.find_by(email_address: email, password: pass)
	end
end
