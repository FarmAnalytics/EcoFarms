class ChatroomsController < ApplicationController
  
  def index
    skip_authorization
    @user = current_user
    @chatrooms = policy_scope(Chatroom).where(user_id: @user.id)
  end

  def show
    skip_authorization
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # @messages = Message.where(chatroom_id: @chatroom.id)
    # raise
  end

end
