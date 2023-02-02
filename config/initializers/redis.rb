$redis_users_online = Redis.new
$redis_users_online.del('users')
