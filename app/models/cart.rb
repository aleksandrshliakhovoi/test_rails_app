class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :items
  has_many :objects, through: :join_association, source: :join_association_table_foreign_key_to_objects_table
end
