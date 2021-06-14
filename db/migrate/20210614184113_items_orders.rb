class ItemsOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :items_orders, id: false do |t| #id false because join table
      t.belongs_to :item
      t.belongs_to :order
    end
  end
end
