class HomeController < ApplicationController
	def index
		@delivery_call = DeliveryCall.new
		@today_calls = DeliveryCall.today_calls
	end
end
