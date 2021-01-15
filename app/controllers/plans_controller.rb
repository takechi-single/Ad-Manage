class PlansController < ApplicationController
  before_action :set_item, only: %i[index create new]
  before_action :sales_sum, only: %i[show]
  before_action :item_back, only: %i[show]

  def index
    
  end

  def new
    @plan = Plan.new
    @item = Item.find_by(params[:item_id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.valid?
      @plan.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:item_id])
    @plan = Plan.find_by(item_id: params[:item_id])
  end

  
  private

  def plan_params
    params.require(:plan).permit(:when, :where,:with_whom, :target_id, :media_id, :how_many, :how_much).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_back
    redirect_to root_path if id = nil
  end

  def sales_sum
    @plan_sum = Plan.where(item_id: params[:item_id])
    @total_price = @plan_sum.sum(:how_much)

  end

  


  
end
