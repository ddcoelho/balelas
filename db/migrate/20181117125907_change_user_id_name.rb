class ChangeUserIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :user_id_id, :user_id
  end
end
