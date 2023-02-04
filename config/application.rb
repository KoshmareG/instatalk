require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'

require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module Instatalk
  def self.redis
    @redis ||= ConnectionPool::Wrapper.new do
      Redis.new(url: ENV["REDIS_URL"], namespace: "#{ENV["REDIS_URL"]}/3")
    end
  end

  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.default_locale = :ru
    config.generators.system_tests = nil
  end
end
