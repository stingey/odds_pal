require 'sidekiq/api'

Sidekiq.configure_client do |config|
  # config.redis = { :url => "redis://#{host}:#{port}/#{db}", :namespace => 'sidekiq'}
  config.redis = { ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
end

Sidekiq.configure_server do |config|
  # config.redis = { :url => "redis://#{host}:#{port}/0", :namespace => 'sidekiq' }
  config.redis = { ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
end

schedule_file = Rails.root + "/config/schedule.yml"
if File.exist?(schedule_file)
  sidekiq_cron = YAML.load_file(schedule_file)
  Sidekiq::Cron::Job.load_from_hash sidekiq_cron[Rails.env]
end
