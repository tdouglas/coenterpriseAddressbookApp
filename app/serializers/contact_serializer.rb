class ContactSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :firstname, :lastname, :phone_cell, :phone_home, :email, :address

end
