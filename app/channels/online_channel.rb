class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    current_user&.update!(status: true)
    current_user&.broadcast_append_to('online_users', target: 'users-online')
    super
  end

  def unsubscribed
    current_user&.update!(status: false)
    current_user&.broadcast_remove_to('online_users')
    super
  end
end
