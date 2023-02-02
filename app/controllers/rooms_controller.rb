class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_room, only: %i[show destroy]

  def index
    @rooms = Room.all
    @room = Room.new
    @users_online = User.where(id: $redis_users_online.hgetall('users').keys)
  end

  def show
    @new_message = @room.messages.build(params[:message])
  end

  def create
    @room = Room.create!

    @room.broadcast_append_to :rooms

    redirect_to @room
  end

  def destroy
    @message = @room.messages.create!(body: I18n.t('room.room_deleted'), technical: true)

    @message.broadcast_append_to @room

    @room.destroy

    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find_by!(token: params[:token])
  end
end
