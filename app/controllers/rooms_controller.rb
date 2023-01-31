class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
    @room = Room.new
    @users_online = User.where(status: true)
  end

  def show
    @new_message = @room.messages.build(params[:message])
  end

  def create
    @room = Room.create!

    @room.broadcast_append_to :rooms

    redirect_to @room, notice: 'Комната успешно создана!'
  end

  private

  def set_room
    @room = Room.find_by!(token: params[:token])
  end
end
