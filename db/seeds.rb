# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
user = User.new(email:"fran@alu.itba.edu.ar", password:"12345678")
user.save!

user = User.new(email:"cris@alu.itba.edu.ar", password:"12345678")
user.save!

user = User.new(email:"dbkazarian@gmail.com", password:"12345678")
user.save!