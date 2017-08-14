class ProductChannel < ApplicationCable::Channel
	def subscribed
		stream_from "product"
	end

	def unsubscribed
		
	end
end