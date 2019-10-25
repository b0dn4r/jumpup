class AddAttachmentImgToPostImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :post_images do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :post_images, :img
  end
end
