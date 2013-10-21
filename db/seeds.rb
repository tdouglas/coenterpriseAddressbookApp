# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.create!(firstname:'John', lastname:'Doe', phone_cell:'202-321-3443', email:'johnnyboy@gmail.com', address:'123 johnny lane ny, ny 10033')
Contact.create!(firstname:'Sarah', phone_cell:'646-304-1223', email:'sarah@yahoo.com')
Contact.create!(firstname:'Karen', phone_cell:'860-493-2932')
Contact.create!(firstname:'Gary', phone_cell:'305-349-3942')
Contact.create!(firstname:'Sharon', phone_cell:'201-493-2299')
