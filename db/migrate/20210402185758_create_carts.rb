class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id # when we put something to cart we want to know which user have it
      t.timestamps
    end
  end
end
