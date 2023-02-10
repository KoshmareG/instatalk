class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    Instatalk.redis.hincrby('users', current_user&.id, 1)

    current_user&.broadcast_append_to('online_users', target: 'users-online')

    super
  end

  def unsubscribed
    Instatalk.redis.hincrby('users', current_user&.id, -1)

    broadcast_remove_user if Instatalk.redis.hget('users', current_user&.id).to_i <= 0

    super
  end

  private

  def broadcast_remove_user
    Instatalk.redis.hdel('users', current_user&.id)

    current_user&.broadcast_remove_to('online_users', target: "user_#{current_user&.id}")
  end
end
