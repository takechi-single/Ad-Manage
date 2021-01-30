class ManagesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :find_plan, only: [:edit, :update, :destroy]
  before_action :set_confirm, only: [:edit, :destroy]

  def index
    
  end

  def show
    
    @manage = Manage.find(params[:id])
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

  def edit
  end

  def update
    @manage.update(manage_params)
    if @manage.valid?
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @manage.destroy
    redirect_to action: :show
  end

  private

  def manage_params
    params.require(:manage).permit(:sale_date, :profit).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @items = Item.all.includes(:user)
  end

  def find_plan
    @manage = Manage.find(params[:id])
  end

  def set_confirm
    redirect_to action: :index if current_user.id != @manage.user_id
  end
end
