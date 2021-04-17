class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id # orders may have many users_id
      t.timestamps
    end
  end
end
