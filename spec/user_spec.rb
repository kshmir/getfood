require 'spec_helper'


describe User do
	it "Should fail" do
		expect { User.create! }.to raise_error
	end
end