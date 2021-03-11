class ItemsController < ApplicationController
  layout false #doesnt require a view
  #seacrh all goods in db
  def index
    @items = Item.all
    render body: @items.map { |i| "#{i.name}:#{i.price}"}
  end

  def create
    Item.create(items_params)
    render body: 'create'
  end


  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description) #here is params which could to save in db
    #if hash transmitted with other params he doesnt gbe saved
  end
end
