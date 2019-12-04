class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships, primary_key: [:user_id, :friend_id] do |t|
      t.references :user, foreign_key: true
      t.references :friend
      t.boolean :confirmed, default: false

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
