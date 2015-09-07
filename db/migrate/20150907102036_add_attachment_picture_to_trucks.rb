class AddAttachmentPictureToTrucks < ActiveRecord::Migration
  def self.up
    change_table :trucks do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :trucks, :picture
  end
end
