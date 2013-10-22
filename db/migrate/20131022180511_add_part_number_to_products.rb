class AddPartNumberToProducts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :contacts, :picture
  end
end
