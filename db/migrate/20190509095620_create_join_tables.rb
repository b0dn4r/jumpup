class CreateJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_join_table :PostTypes, :Posts do |t|
      t.index [:post_type_id, :post_id]
      t.index [:post_id, :post_type_id]
    end
  end
end
