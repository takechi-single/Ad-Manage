class PlansController < ApplicationController
  before_action :set_item, only: %i[index create new]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.valid?
      @plan.save
      redirect_to "/items/#{plas.item.id}"
    else
      render action: :new
    end
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @item = Item.find(params[:item_id])
  end

  private

  def plan_params
    params.require(:plan).permit(:when, :when_by, :where, :who, :with_whom, :target_id, :media_id, :why, :how_many, :how_much).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
    @items = Item.all
  end
end
