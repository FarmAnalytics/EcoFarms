class ListsController < ApplicationController

  def index
    skip_authorization
    @user = current_user
    @lists = policy_scope(List).where(user: current_user.id)
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
