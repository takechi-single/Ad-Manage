class PlansController < ApplicationController
  

  def create
    plan = Plan.create(plan_params)
    redirect_to "/items/#{plan.item.id}"
  end

  private
  def plan_params
    params.require(:plan).permit(:when, :when_by, :where, :who, :with_whom, :whom, :what, :why, :how, :how_many, :how_much).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
