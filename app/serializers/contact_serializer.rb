class ContactSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :firstname, :lastname, :phone, :email, :street_address, :city_address, :apt_address, :state_address, :zip_address, :picture

  def picture
    object.picture.url
  end
end
