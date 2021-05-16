class ItemsController < ApplicationController
  #layout false # doesnt require a view
  # seacrh all goods in db

  skip_before_action :verify_authenticity_token # skip before endpoints
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?, only: %i[edit update new destroy]
  after_action :show_info, only: %i[index]

  # show all items in db
  def index
    # @items = Item
    # @items = @items.where('price >= ?', params[:price_from]) if params[:price_from] 
    # @items = @items.where('created_at >= ?', 1.day.ago) if params[:today]
    # @items = @items.where('votes_count >=?', params[:votes_from]) if params[:votes_from]
    # @items = @items.order(:id)
    #render body: @items.map { |i| "#{i.name}:#{i.price}"}
    @items = Item.all
    @items = @items.includes(:image)
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

  end

  def edit
    
  end

  def update
    
    #binding.pry # debagger #check data
    
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

  #another route
  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path 
  end


  def expensive
    @items = Item.where('price > 50')
    render :index # have to write it becaus it wiil be render expensive template which doesnt exist
  end

  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description) #here is params which could to save in db
    #if hash transmitted with other params he doesnt gbe saved
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def show_info
    puts 'Index endpoint'
  end
end
