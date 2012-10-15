pid_file = "#{shared_path}/pids/unicorn.pid"
socket_file = "#{shared_path}/unicorn.sock"
log_file = "#{app_root}/log/unicorn.log"
err_log_file = "#{app_root}/log/unicorn_error.log"
old_pid = pid_file + '.oldbin'


env = ENV['RAILS_ENV'] || 'development'

worker_processes 2
timeout 30
listen socket_file, :backlog => 1024

pid pid_file
stderr_path err_log_file
stdout_path log_file

preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
end

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # Someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
end
