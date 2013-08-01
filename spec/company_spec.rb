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
end