class UsersController < ApplicationController

  def profile
    @user = current_user
    authorize @user
    @shops = Shop.where(user: current_user.id)
    @shop = Shop.new
  end  

  def update
    skip_authorization
    current_user.update(user_params)
    redirect_to profile_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
