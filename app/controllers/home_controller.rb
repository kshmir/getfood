class HomeController < ApplicationController
	def index
		@delivery_call = DeliveryCall.new
		@today_calls = DeliveryCall.today_calls
		@times = ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30"]
		@menus = []
# helper code
		delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
		5.times do |i|
			delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
		end
		delivery.save
		delivery

		Delivery.all.each do |delivery|
			delivery.menus.each do |menu|
				@menus << "${delivery} - {menu}"
			end
		end
	end
end
