class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :room_price
      t.text :room_address
      t.string :room_image

      t.timestamps
      drop_table :posts
    end
  end
end
