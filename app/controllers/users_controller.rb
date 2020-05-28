class UsersController < ApplicationController
  def show
    @user = current_user
    @shops = Shop.where(user: current_user.id)
    authorize @user
  end

  def edit
    @user = current_user
    @shops = Shop.where(user: current_user.id)
    authorize @user
  end
  
end
