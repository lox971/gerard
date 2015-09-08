class AddAttachmentPictureToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :customers, :picture
  end
end
