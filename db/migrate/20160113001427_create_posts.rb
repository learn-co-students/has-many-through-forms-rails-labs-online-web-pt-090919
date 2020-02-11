class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.index :post_id 
      t.index :user_id 
      t.timestamps null: false
    end
  end
end
