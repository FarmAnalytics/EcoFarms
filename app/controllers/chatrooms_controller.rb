class ChatroomsController < ApplicationController
  
  def index
    skip_authorization
    @user = current_user
    @chatrooms = policy_scope(Chatroom).where(user_id: @user.id)

    @farm = Farm.find_by(user_id: @user.id)
    if !@farm.nil?
      @chatrooms_farm = policy_scope(Chatroom).where(farm_id: @farm.id)
    end
  end

  def show
    skip_authorization
    @user = current_user

    #pour la partie index des chatrooms
    @chatrooms = policy_scope(Chatroom).where(user_id: @user.id)
    @farm = Farm.find_by(user_id: @user.id)
    if !@farm.nil?
      @chatrooms_farm = policy_scope(Chatroom).where(farm_id: @farm.id)
    end

    #pour le chat
    @chatroom_first = Chatroom.find(params[:id])
    @messages = @chatroom_first.messages

    @message = Message.new

  end

end
