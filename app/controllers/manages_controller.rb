class ManagesController < ApplicationController
  

  def index
    @items = Item.all.includes(:user)
  end

  def show
    @items = Item.all.includes(:user)
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

end
