require 'spec_helper'


describe Menu do
	it "Should not allow to create an empty menu" do
		expect { Menu.create! }.to raise_error
	end

	it "Should allow to create a menu with price and description" do
		menu = Menu.create price: 1.0, description: "lalala"
	    delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
	    delivery.menus << menu
		menu.save.should == true
	end
end