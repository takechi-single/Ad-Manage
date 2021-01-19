class ManagesController < ApplicationController
  before_action :set_item, only: %i[create show]

  def index
    @items = Item.all.includes(:user)
  end

  def show
    @items = Item.all.includes(:user)
  end

  def new
    
  end

  def create
    
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
