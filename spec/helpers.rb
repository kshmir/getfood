module Helpers
	def sign_in_with username, password
		visit root_path
		within("#new_user") do
		  fill_in 'user[email]', :with => username
		  fill_in 'user[password]', :with => password
		end
		click_button('Sign in')
		visit root_path
	end

	def sign_in_example_user!
		sign_in_with 'user@example.com', 'testpass1'
	end

	def create_example_user_with_some_company!
		company = Company.new(name:"Company")
		user = User.new(email:"fran@alu.itba.edu.ar", password:"12345678")
		company.users << user
		company.save!
		user
	end

	def create_example_user!
		User.create!(:email => 'user@example.com', :password => 'testpass1')
	end

	def create_example_delivery!
		delivery = Delivery.create name: "La farolita", phone: "123456789", type: "Rotiseria"
		5.times do |i|
			delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
		end
		delivery.save
		delivery
	end
end