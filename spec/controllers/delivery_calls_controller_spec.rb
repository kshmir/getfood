require 'spec_helper'

describe DeliveryCallsController do

  before :each do
    @user = create_example_user!
    sign_in_example_user! 
  end

  describe "GET /deliveries_calls" do

    before :each do
      @delivery_call = create_example_delivery_call! @user    
    end 

    it "should display delivery_call at index" do
      visit delivery_calls_path
      page.should have_content(@delivery_call.delivery_time)
      page.should have_content(@delivery_call.status)
      page.should have_content(@delivery_call.delivery)
      page.should have_content(@delivery_call.calling_user)
    end

    it "should show delivery_call attributes" do
      visit delivery_calls_path
      click_on @delivery_call.id
      page.should have_content(@delivery_call.delivery_time)
      page.should have_content(@delivery_call.status)
      page.should have_content(@delivery_call.delivery)
      page.should have_content(@delivery_call.calling_user)
      @delivery_call.delivery_requests.each {|request| page.should have_content(request.user)}
    end

  end

  describe "PUT /deliveries_calls" do
    
    it "should add a request to the delivery_call" do
      @another_user = User.create!(:email => 'another_user@example.com', :password => 'testpass1')
      @delivery_call = create_example_delivery_call! @another_user
      binding.pry
      visit delivery_call_path(@delivery_call)
      click_on "New"
      select "Comida 1", from: "Menus"
      click_on "Update Delivery call"
      binding.pry
      @delivery_call.delivery_requests.count.should == 2
      page.should have_content("Delivery call was successfully updated.")
    end

  end


end
