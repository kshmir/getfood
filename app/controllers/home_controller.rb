class HomeController < ApplicationController
	def index

		# raise
		@delivery_call = DeliveryCall.new
		@delivery_call.delivery_requests.build
		@today_calls = DeliveryCall.today_calls
		@times = ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30"]
		
	end
end
