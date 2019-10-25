class AddAttachmentImgToCategories < ActiveRecord::Migration[5.2]
  def self.up
    change_table :categories do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :categories, :img
  end
end
