require 'spec_helper'

describe "DeliveryCall" do
  before :each do 
    create_example_user_with_company!
    sign_in_example_user!
    create_example_delivery!  
  end

  it "should allow a valid form" do
    visit root_path
    within("#new_delivery_call") do
      find("menu[value='La Farolita - Comida 1']").click
      find("time[value='12:30']").click
    end
    click_button('Create')
    current_path.should == root_path
    page.body.should_not be_empty
  end

end