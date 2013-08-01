require 'spec_helper'


describe Menu do
	it "Should not allow to create an empty menu" do
		expect { Menu.create! }.to raise_error
	end

	it "Should allow to create a menu with price and description" do
		menu = Menu.create price: 1.0, description: "lalala"
		menu.save.should == true
	end
end