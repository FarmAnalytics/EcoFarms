class ListsController < ApplicationController

  def index
    @user = current_user
    @lists = List.where(user: current_user.id)
    authorize @user
  end


end
