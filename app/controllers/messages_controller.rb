class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @room = Room.find_by!(token: params[:room_token])

    @new_message = @room.messages.build(message_params)
    @new_message.user = current_user

    if @new_message.save
      @new_message.broadcast_append_to @new_message.room
    end

    update_user_activity(current_user)

  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
