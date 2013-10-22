class Contact < ActiveRecord::Base
  belongs_to :user

  has_attached_file :picture, :styles => {:thumb => "218x218>" }, default_url: 'assets/default_photo.png'

  def fullname
    "#{self.fisrtname} #{self.lastname}"
  end
end