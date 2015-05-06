Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/1',
                   namespace: 'sidekiq',
                   driver: :hiredis }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/1',
                   namespace: 'sidekiq',
                   driver: :hiredis }
end
