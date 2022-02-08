class CreateJoinTableLikedPostsUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users, table_name: :chosen_posts
  end
end
