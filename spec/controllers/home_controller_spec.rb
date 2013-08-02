require 'spec_helper'

describe HomeController do
	before :each do 
		create_example_user!  
	end

	it "Should list a table with the deliveries and a form to create a new one" do
		sign_in_example_user!
		page.has_selector?('.today-calls').should == true
	end

	it "Should list a set of deliveries that are done today" do
		@user = User.first
		delivery = create_example_delivery!
		5.times do 
			menu = DeliveryCall.new delivery_time: DateTime.now, calling_user: @user
			menu.delivery_requests << DeliveryRequest.new(user: @user, menus: delivery.menus)
			menu.save
		end
		1.times do 
			menu = DeliveryCall.new delivery_time: (DateTime.now + 1.day), calling_user: @user
			menu.delivery_requests << DeliveryRequest.new(user: @user, menus: delivery.menus)
			menu.save
		end
		sign_in_example_user!
		all(".delivery-call").count.should == DeliveryCall.today_calls.count
	end
end
