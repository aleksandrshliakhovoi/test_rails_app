class ItemsController < ApplicationController
  layout false # doesnt require a view
  # seacrh all goods in db

  skip_before_action :verify_authenticity_token # skip before endpoints
  before_action :find_item, only: %i[show edit update destroy]


  # show all items in db
  def index
    @items = Item.all
    #render body: @items.map { |i| "#{i.name}:#{i.price}"}
  end

  # create one object
  def create
    item = Item.create(items_params)

    if item.persisted?
      #render json: item.name, status: :created
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end

    
  end

  def new; end

  def show
    render body: 'Page not found', status: 404  unless @item
  end

  def edit
    render body: 'Page not found', status: 404  unless @item
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end



  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description) #here is params which could to save in db
    #if hash transmitted with other params he doesnt gbe saved
  end

  def find_item
    @item = Item.where(id: params[:id]).first
  end
end
