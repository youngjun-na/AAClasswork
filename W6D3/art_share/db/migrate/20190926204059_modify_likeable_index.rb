class ModifyLikeableIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, :likeable_id
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
  end
end
