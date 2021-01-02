class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.valid?
      @user.save
      redirect_to action: :index
    end
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
