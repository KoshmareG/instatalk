Warden::Manager.after_set_user do |user, auth, opts|
  auth.cookies.signed[:user_id] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  Instatalk.redis.hdel('users', user.id)

  auth.cookies.delete :user_id

  ActionCable.server.remote_connections.where(current_user: user).disconnect
end
