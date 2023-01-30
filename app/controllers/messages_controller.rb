class MessagesController < ApplicationController
  before_action :set_room, only: [:create]

  def create
    @new_message = @room.messages.build(message_params)
    @new_message.user = current_user

    if @new_message.save
      @new_message.broadcast_append_to @new_message.room
    end
  end

  private

  def set_room
    @room = Room.find_by!(token: params[:room_token])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
