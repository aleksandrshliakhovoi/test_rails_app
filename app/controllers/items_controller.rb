class ItemsController < ApplicationController
  layout false # doesnt require a view
  # seacrh all goods in db

  skip_before_action :verify_authenticity_token # skip before endpoints

  # show all items in db
  def index
    @items = Item.all
    #render body: @items.map { |i| "#{i.name}:#{i.price}"}
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
  def show
    #id is equal to id which we transmit in params in URL
    @item = Item.where(id: params[:id]).first #we use method first that for return not an array just single element
    if @item
      render 'items/show'
    else
      render body: 'Page not found', status: 404
    end
  end

  def edit; end

  def update; end

  def destroy
    item = Item.where(id: params[:id]).first.destroy

    if item.destroyed?
      redirect_to items_path
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
