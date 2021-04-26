class DeleteColumntItemIdFromImages < ActiveRecord::Migration[6.1]
  remove_column :images, :item_id
end
