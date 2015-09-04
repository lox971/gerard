class AddAttachmentPictureToMovers < ActiveRecord::Migration
  def self.up
    change_table :movers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :movers, :picture
  end
end
