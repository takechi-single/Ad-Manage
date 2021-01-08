class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, only: %i[index edit new create]
  def index
    
  end  

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def update; end

  def destroy; end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :relese_date, :image).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.all
  end
end
