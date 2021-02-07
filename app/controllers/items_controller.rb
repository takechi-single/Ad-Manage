class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[new edit]
  before_action :set_item, only: %i[index edit new create search]
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :set_confirm, only: [:edit, :destroy]
  before_action :move_to_index, except: [:index, :search]
  

  def index
    @plans = Plan.all
    @manages = Manage.all
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


  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to action: :index
    else
      render action: :edit, alert: @item.errors.full_messages
    end
    
    
  end

  def search
    @items = Item.search(params[:keyword])
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

  def set_confirm
    redirect_to action: :index if current_user.id != @item.user_id
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    
  end

  
end
