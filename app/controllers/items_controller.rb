class ItemsController < ApplicationController
  layout false # doesnt require a view
  # seacrh all goods in db

  skip_before_action :verify_authenticity_token # skip before endpoints

  # show all items in db
  def index
    @items = Item.all
    render body: @items.map { |i| "#{i.name}:#{i.price}"}
  end

  # create one object
  def create
    item = Item.create(items_params)

    if item.persisted?
      render json: item.name, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end

    
  end

  def new; end

  # show current id
  def show; end

  def edit; end

  def update; end

  def destroy; end



  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description) #here is params which could to save in db
    #if hash transmitted with other params he doesnt gbe saved
  end
end
