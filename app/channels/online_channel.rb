class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    current_user&.update!(last_activity: Time.now)
    current_user&.broadcast_append_to('online_users', target: 'users-online')
    super
  end
end
