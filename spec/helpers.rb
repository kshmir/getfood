module Helpers
	def sign_in_with username, password
		visit root_path
		within("#new_user") do
		  fill_in 'user[email]', :with => username
		  fill_in 'user[password]', :with => password
		end
		find('#new_user input[type=submit]').click
		visit root_path
	end

	def sign_in_example_user!
		sign_in_with 'user@example.com', 'testpass1'
	end

	def create_company_with_user company_name, user_name
		company = Company.new(name: company_name)
		user = User.create!(:email => "#{user_name}@example.com", :password => 'testpass1')		
		company.users << user
		company.save!
		company
	end

	def create_example_user_with_company!
		company = Company.new(name:"Company")
		user = User.create!(:email => 'company_user@example.com', :password => 'testpass1')		
		company.users << user
		company.save!
		user
	end

	def create_users_with_different_companies!
		create_company_with_user "Company", "company_user1"
		create_company_with_user "Company2", "company_user2"
	end

	def create_example_user!
		User.create!(:email => 'user@example.com', :password => 'testpass1')
	end

	def create_example_delivery!
		delivery = Delivery.create name: "La farolita", phone: "123456789", delivery_type: "Rotiseria"
		5.times do |i|
			delivery.menus << Menu.create(description: "Comida #{i}", price: (i * i))
		end
		delivery.save
		delivery
	end
end