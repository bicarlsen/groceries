class OrderItem < ActiveRecord::Base
	# Relations
	belongs_to :order

	# Validations
	validates :quantity, presence: true	
	validates :unit, presence: true
 	validates :unit_price, presence: true
	validates :name, presence: true
	validate :item_id_is_present

	def item_id_is_present
		if self.plu.nil? && self.upc.nil?
		end
	end

end
