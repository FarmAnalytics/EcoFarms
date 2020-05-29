class ListsController < ApplicationController

  def index
    skip_authorization
    @user = current_user
    @lists = policy_scope(List).where(user: current_user.id)
  end


end
