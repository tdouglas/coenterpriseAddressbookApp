class Contact < ActiveRecord::Base
  belongs_to :user

  def fullname
    "#{self.fisrtname} #{self.lastname}"
  end
end
