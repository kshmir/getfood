require 'spec_helper'

describe Delivery do

    context "when not valid" do
        it { expect { Delivery.create! }.to raise_error }
    end
    context "when two users are the same" do 
        it "should not save the second" do
            delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
            delivery.save.should == true
            delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
            delivery.save.should == false 
        end
        
    end

    context "having a valid delivery" do
        let :delivery do
            delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
            5.times do |i|
                delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
            end
            delivery
        end
        it "should be saved" do
            delivery.save.should == true
        end
        it "should destroy all menues after deletion" do
            delivery.destroy
            Menu.count.should == 0
        end
    end
end