class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item, only: %i[index edit new create]
  before_action :find_item, only: [:edit, :update, :destroy]

  def index
    @plans = Plan.all
  end  

  def new
    @item = Item.new
  
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path(@item.id)
    else
      render action: :new
    end
  end

  def show
    
    @item = Item.find(params[:id])
    @plan = Plan.find_by(item_id: @item.id)
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def edit; end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to action: :index
    else
      render action: :edit, alert: @item.errors.full_messages
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :relese_date, :image).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.all.includes(:user)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
