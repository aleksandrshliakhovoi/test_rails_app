class ItemsController < ApplicationController
  layout false #doesnt require a view
  #seacrh all goods in db

  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
    render body: @items.map { |i| "#{i.name}:#{i.price}"}
  end

  def create
    item = Item.create(items_params)

    if item.persisted?
      render json: item.name, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end

    
  end


  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description) #here is params which could to save in db
    #if hash transmitted with other params he doesnt gbe saved
  end
end
