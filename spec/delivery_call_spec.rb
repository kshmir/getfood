require 'spec_helper'


describe DeliveryCall do
	it "Should not allow to create an DeliveryCall" do
		expect { DeliveryCall.create! }.to raise_error
	end

	it "Should allow to create DeliveryCall with a datetime, a user, and a non empty list of items" do
		delivery = create_example_delivery!
		u = create_example_user!
		menu = DeliveryCall.create delivery_time: DateTime.now, calling_user: u
		menu.delivery_requests << DeliveryRequest.create!(user: u, menus: delivery.menus)
		menu.save.should == true
	end
end