class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    current_user&.update!(status: true)
    super
  end

  def unsubscribed
    current_user&.update!(status: false)
    super
  end
end
