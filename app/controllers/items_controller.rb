class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @items = Item.includes(:user)
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

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :relese_date, :image).merge(user_id: current_user.id)
  end
end
