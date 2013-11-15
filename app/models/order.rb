class Order < ActiveRecord::Base
	# Relations
	belongs_to :user
	has_many :order_items

	# Hooks
	before_save { self.pickup_time = pickup_time.utc } 	

	# Validations
	validates :confirmation_number, presence: true
	validates :pickup_time, presence: true 
	validate	:pickup_time_is_valid
	validates :is_purchased, presence: true

	def pickup_time_is_valid
		utc_time = self.pickup_time.utc
		if utc_time < DateTime.now.utc # Pickup time is in the past
			errors[:base].push "Invalid pickup time."
		end
	end
end
