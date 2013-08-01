require 'spec_helper'

describe User do
	it "Should fail when not passing parameters" do
		expect { User.create! }.to raise_error
	end

	it "Should save with username password" do
		user = User.new(email:"fran@alu.itba.edu.ar", password:"12345678")
		user.valid?.should == true
		user.save.should == true
	end

	it "Should fail due to small password" do
		user = User.new(email:"fran@alu.itba.edu.ar", password:"12345")
		user.valid?.should == false 
	end

	it "Should fail due to invalid email" do
		user = User.new(email:"fran", password:"12345")
		user.valid?.should == false 
	end
end