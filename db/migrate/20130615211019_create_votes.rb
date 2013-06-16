class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
    add_index :votes, [:user_id, :post_id, :created_at]
  end
end
