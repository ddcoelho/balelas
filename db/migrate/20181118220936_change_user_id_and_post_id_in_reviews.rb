class ChangeUserIdAndPostIdInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :user_id_id, :user_id
    rename_column :reviews, :post_id_id, :post_id
  end
end
