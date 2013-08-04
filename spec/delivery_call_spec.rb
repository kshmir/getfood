require 'spec_helper'


describe DeliveryCall do
	it "Should not allow to create an DeliveryCall" do
		expect { DeliveryCall.create! }.to raise_error
	end

	it "Should allow to create DeliveryCall with a datetime, a user, and a non empty list of items" do
		delivery = create_example_delivery!
		u = create_example_user!
		menu = DeliveryCall.new delivery_time: DateTime.now, calling_user: u, delivery: delivery
		menu.delivery_requests << DeliveryRequest.new(user: u, menus: delivery.menus)
		menu.save.should == true
	end

	it "Should NOT allow to create DeliveryCall without a delivery request" do
		delivery = create_example_delivery!
		u = create_example_user!
		menu = DeliveryCall.new delivery_time: DateTime.now, calling_user: u, delivery: delivery
		menu.save.should_not == true
	end

	it "Should NOT allow to create DeliveryCall with employees from different companies" do
		delivery = create_example_delivery!
		u = create_example_user!
		u2 = create_example_user_with_company!
		menu = DeliveryCall.new delivery_time: DateTime.now, calling_user: u, delivery: delivery
		menu.delivery_requests << DeliveryRequest.new(user: u2, menus: delivery.menus)
		menu.save.should_not == true
	end

	it "Should list today calls and not other days" do
		create_example_user!  
		@user = User.first
		delivery = create_example_delivery!
		5.times do 
			menu = DeliveryCall.new delivery_time: DateTime.now, calling_user: @user, delivery: delivery
			menu.delivery_requests << DeliveryRequest.new(user: @user, menus: delivery.menus)
			menu.save
		end
		1.times do 
			menu = DeliveryCall.new delivery_time: (DateTime.now + 1.day), calling_user: @user, delivery: delivery
			menu.delivery_requests << DeliveryRequest.new(user: @user, menus: delivery.menus)
			menu.save
		end
		DeliveryCall.today_calls.count.should == 5
	end
end