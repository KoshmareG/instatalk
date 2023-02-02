class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    $redis_users_online.hset('users', current_user&.id, current_user&.nickname)
    current_user&.broadcast_append_to('online_users', target: 'users-online')
    super
  end

  def unsubscribed
    $redis_users_online.hdel('users', current_user&.id)
    current_user&.broadcast_remove_to('online_users', target: "user_#{current_user.id}")
    super
  end
end
