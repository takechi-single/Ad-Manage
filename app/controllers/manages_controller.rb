class ManagesController < ApplicationController
  before_action :set_item, only: %i[show]

  def index
    @items = Item.all.includes(:user)
  end

  def show
    @items = Item.all.includes(:user)
  end

  def new
    @manage = Manage.new
  end

  def create
    @manage = Manage.new(manage_params)
    if @manage.valid?
      @manage.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def manage_params
    params.require(:manage).permit(:sale_date,:profit).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
