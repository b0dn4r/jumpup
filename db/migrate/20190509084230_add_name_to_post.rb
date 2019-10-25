class AddNameToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment, :text
    add_column :posts, :active, :boolean, default: true
    add_column :posts, :title, :string
    add_column :posts, :keywords, :text
  end
end
