require 'spec_helper'

describe Delivery do
    it "Should not allow to create an empty delivery" do
        expect { Delivery.create! }.to raise_error
    end

  it "Should not allow to create deliveries with same name" do
    delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
    delivery.save.should == true
    delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
    delivery.save.should == false
  end

    it "Should have menues" do
        delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
        5.times do |i|
            delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
        end
        delivery.save.should == true
    end

    it "Should destroy all menues after deletion" do
        delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
        5.times do |i|
            delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
        end
        delivery.save.should == true
        delivery.destroy
        Menu.count.should == 0
    end
end