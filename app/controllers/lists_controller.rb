class ListsController < ApplicationController

  def index
    skip_authorization
    @user = current_user
    @lists = policy_scope(List).where(shop_id: Shop.where(user_id: current_user.id))
  end

  def create
    skip_authorization
    @shop = Shop.where(user_id: current_user.id).first
    #authorize @shop
    @list = List.new(list_params)
    @list.shop = @shop
    if @list.save
      flash[:notice] = "Votre liste a été créée"
      redirect_to user_lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    redirect_to user_lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
