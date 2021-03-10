class Item < ApplicationRecord

  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true

  after_initialize {p 'initialize'} # after Item.new
  after_save       {p 'save'} # Item.create
  after_update     {p 'update'}
  after_destroy    {p 'destroy'}
end
