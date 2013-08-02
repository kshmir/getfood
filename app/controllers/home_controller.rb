class HomeController < ApplicationController
	def index
		@delivery_call = DeliveryCall.new
	end
end
