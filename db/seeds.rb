# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(firstname: 'Bob', lastname: 'Smith', email: 'bsmith@mail.com', password: 'password')
user.contacts.create!(firstname:'John', lastname:'Doe', phone:'202-321-3443', email:'johnnyboy@gmail.com', street_address:'123 johnny lane', apt_address: '21a', city_address: 'new york', state_address: 'ny', zip_address: '10033')
user.contacts.create!(firstname:'Sarah', phone:'646-304-1223', email:'sarah@yahoo.com')
user.contacts.create!(firstname:'Karen', phone:'860-493-2932')
user.contacts.create!(firstname:'Gary', phone:'305-349-3942')
user.contacts.create!(firstname:'Sharon', phone:'201-493-2299')
