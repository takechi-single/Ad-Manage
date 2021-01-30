class PlansController < ApplicationController
  before_action :set_item, only: %i[edit update index create new show]
  before_action :sales_sum, only: %i[show]
  before_action :item_back, only: %i[show edit update destroy]
  before_action :find_plan, only: [:edit, :update, :destroy]
  before_action :set_confirm, only: [:edit, :update, :destroy]

  def index
    @plans = Plan.all
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
    @plans = Plan.all
    @plan = Plan.find_by(item_id: params[:item_id])
  end

  def edit
  end

  def update
    @plan.update(plan_params)
    if @plan.valid?
      redirect_to action: :show
    else
      render action: :edit, alert: @plan.errors.full_messages
    end
  end

  def destroy
    @plan.destroy
    redirect_to action: :show
  end

  private

  def plan_params
    params.require(:plan).permit(:when, :where, :target_id, :media_id, :how_much).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def set_confirm
    redirect_to action: :index if current_user.id != @plan.user_id
  end

  def item_back
    redirect_to root_path if id = nil
  end

  def sales_sum
    @plan_sum = Plan.where(item_id: params[:item_id])
    @total_price = @plan_sum.sum(:how_much).to_i
    @manage_sum = Manage.where(item_id: params[:item_id])
    
    @sales = @manage_sum.sum(:profit).to_i
    @roas = format('%.0f', (@sales.to_f / @total_price.to_f * 100).to_f)
  end
end
