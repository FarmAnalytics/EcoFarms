class ChatroomsController < ApplicationController
  
  def index
    skip_authorization
    @user = current_user
    @chatrooms = policy_scope(Chatroom).where(user_id: @user.id)
    @lists = List.all
  end

  def show
    skip_authorization
    @user = current_user
    @chatrooms = policy_scope(Chatroom).where(user_id: @user.id)
    @chatroom_first = Chatroom.find(params[:id])
    @message = Message.new
    # @messages = Message.where(chatroom_id: @chatroom.id)
    # raise
  end

end
