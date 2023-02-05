class ApplicationController < ActionController::Base
  def update_user_activity(user)
    user.broadcast_append_to('online_users', target: 'users-online') if user.last_activity < 10.minutes.ago
    user.update!(last_activity: Time.now)
  end
end
