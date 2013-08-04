require 'spec_helper'

describe "Authentication" do
	before :each do 
		create_example_user!  
	end

	it "should allow a valid sign up" do
		visit "/"
		expect(page).not_to have_selector ".content"
		within("#new_user") do
		  fill_in 'user[email]', :with => 'user@example.com'
		  fill_in 'user[password]', :with => 'testpass1'
		end
		
		find('#new_user input[type=submit]').click
		
		current_path.should == "/"
		expect(page).not_to have_content 'Invalid'
		page.body.should_not be_empty
	end	


	it "should not allow an invalid sign up" do
		visit "/"
		within("#new_user") do
		  fill_in 'user[email]', :with => 'user@example.com'
		  fill_in 'user[password]', :with => 'invalidPass'
		end
		find('#new_user input[type=submit]').click
		expect(page).to have_content 'Invalid'
		current_path.should_not == "/"
		page.body.should_not be_empty
	end	
end