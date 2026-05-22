require 'connection_pool'

pool_size = ENV.fetch("RAILS_MAX_THREADS", 5)

$redis = ConnectionPool.new(size: pool_size, timeout: 5) do
  Redis.new(driver: :hiredis)
end
