class HomeController < ApplicationController
	def index
		@delivery_call = DeliveryCall.new
		@today_calls = DeliveryCall.today_calls
		@times = ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30"]
		@menus = []
		# Borrowed helper code to load the data
		# delivery = Delivery.create name: "La farolita", phone: "telefono", delivery_type: "Rotiseria"
		# 5.times do |i|
		# 	delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
		# end
		# delivery.save!
		# delivery
		# end helper code
		Delivery.all.each do |delivery|
			delivery.menus.each do |menu|
				@menus << ["#{delivery.to_s} - #{menu}", menu.id]
			end
		end
	end
end
