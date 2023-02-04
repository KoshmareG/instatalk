class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    Instatalk.redis.hset('users', current_user&.id, current_user&.nickname)
    current_user&.broadcast_append_to('online_users', target: 'users-online')
    super
  end

  def unsubscribed
    Instatalk.redis.hdel('users', current_user&.id)
    current_user&.broadcast_remove_to('online_users', target: "user_#{current_user.id}")
    super
  end
end
