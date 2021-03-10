class ItemsController < ApplicationController

  #seacrh all goods in db
  def index
    @items = Item.all
    render text: @items.map do |i|
    "#{i.name}:#{i.price}"
    end
  end
end
