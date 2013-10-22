class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname, :lastname, :phone, :email
      t.string :street_address, :apt_address, :city_address, :state_address, :zip_address
      t.integer :user_id
      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
