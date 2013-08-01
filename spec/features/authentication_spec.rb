require 'spec_helper'

describe "Authentication" do
	before :each do 
		create_example_user!  
	end

	it "should allow a valid sign up" do
		visit root_path
		expect(page).not_to have_selector ".content"
		within("#new_user") do
		  fill_in 'user[email]', :with => 'user@example.com'
		  fill_in 'user[password]', :with => 'testpass1'
		end
		click_button('Sign in')
		current_path.should == root_path
		page.body.should_not be_empty
	end	


	it "should not allow an invalid sign up" do
		visit root_path
		within("#new_user") do
		  fill_in 'user[email]', :with => 'user@example.com'
		  fill_in 'user[password]', :with => 'invalidPass'
		end
		click_button('Sign in')
		expect(page).to have_content 'Invalid'
		current_path.should_not == root_path
		page.body.should_not be_empty
	end	
end