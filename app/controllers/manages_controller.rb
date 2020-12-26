class ManagesController < ApplicationController
  def index
    @item = Item.all
  end

  def show
    
  end
end
