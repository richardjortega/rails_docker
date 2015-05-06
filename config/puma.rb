## Config for Puma Server

# Match with physical CPU count
workers 2

# Change default timeout for worker
worker_timeout 120

# Min and Max threads per worker
threads 0, 16

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Default to produciton
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

# Set up socket location
# bind "unix:///var/run/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log"

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
# active_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end
