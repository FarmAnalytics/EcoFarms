class ListsController < ApplicationController

  def index
    @user = current_user
    @lists = List.where(user: current_user.id)
    authorize @user
  end

  def create
    @user = current_user
    @shop = Shop.where(user_id: @user.id).first
    @list = List.new
    @list.name = params[:list][:name]
    @list.shop = @shop
    @list.save
  end

end
