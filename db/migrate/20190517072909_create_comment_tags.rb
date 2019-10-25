class CreateCommentTags < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_tags do |t|
      t.string :name
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
