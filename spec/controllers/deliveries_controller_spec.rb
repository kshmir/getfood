require 'spec_helper'

describe DeliveriesController do
  before :each do 
    create_example_user! 
    sign_in_example_user!    
  end

  describe "GET /deliveries" do

    before :each do
      @delivery = create_example_delivery!
    end 

    it "should display delivery at index" do
      visit deliveries_path
      page.should have_content(@delivery.name)
      page.should have_content(@delivery.phone)
      page.should have_content(@delivery.delivery_type)
    end

    it "should show delivery attributes" do
      visit deliveries_path
      click_on @delivery.name
      page.should have_content(@delivery.name)
      page.should have_content(@delivery.phone)
      page.should have_content(@delivery.delivery_type)
      @delivery.menus.each {|menu| page.should have_content(menu.description)}
    end
  end

  describe "POST /deliveries" do
    it "should create a delivery" do
      visit new_delivery_path
      fill_in "Name", with: "delivery-test"
      fill_in "Phone", with: "123456789"   
      select "Chino", from: "Delivery type"        
      click_on "Create Delivery"
      page.should have_content("Delivery was successfully created.")     
    end
  end

  describe "PUT /deliveries" do
    it "should update the delivery" do
      @delivery = create_example_delivery!
      visit edit_delivery_path(@delivery)  
      fill_in "Name", with: "delivery-test2"
      click_on "Update Delivery"
      page.should have_content("Delivery was successfully updated.")   
    end
  end

  describe "DELETE /deliveries" do
      it "deletes the delivery" do
        @delivery = create_example_delivery!
        visit delivery_path(@delivery)  
        click_on "Delete"
        page.should have_content("Delivery was successfully destroyed.")   
      end   
  end

end
