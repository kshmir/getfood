require 'spec_helper'

describe Company do

	it "Should fail when not passing parameters" do
		expect { Company.create! }.to raise_error
	end

	it "Should save the Company" do
		company = Company.new(name:"Company")
		company.valid?.should == true
		company.save.should == true
	end

	it "Should not allow 2 companies with the same name" do
		company = Company.new(name:"Company")
		company.valid?.should == true
		company.save.should == true
		company = Company.new(name:"Company")
		company.valid?.should == false
		company.save.should == false
	end

	it "On delete should delete its users" do
		company = Company.new(name:"Company")
		user = User.new(email:"fran@alu.itba.edu.ar", password:"12345678")
		company.users << user
		company.save!
		User.count.should == 1
	end
end