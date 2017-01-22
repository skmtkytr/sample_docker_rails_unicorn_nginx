preload_app true
timeout 60
worker_processes 2

app_path = File.dirname(File.dirname(Dir.pwd))
working_directory "#{app_path}/current"

listen "#{app_path}/shared/tmp/sockets/unicorn.sock", backlog: 64
pid "#{app_path}/shared/tmp/pids/unicorn.pid"

stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

GC.respond_to?(:copy_on_write_friendly=) &&
    GC.copy_on_write_friendly = true
check_client_connection false

run_once = true

# test
# root = "#{app_path}/current"
# ENV['GEM_HOME'] = "#{app_path}/shared/bundle"
before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/current/Gemfile"
  # ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
      ActiveRecord::Base.connection.disconnect!

  run_once = false if run_once

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) &&
      ActiveRecord::Base.establish_connection
end
