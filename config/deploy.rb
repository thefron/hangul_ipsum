#$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.3'

set :using_rvm, true
set :rvm_type, :user

require 'bundler/capistrano'

set :application, "Hangul_ipsum"
set :repository,  "git@github.com:thefron/hangul_ipsum.git"

set :scm, :git
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/hangul_ipsum"
set :assets_prefix, 'assets'
set :asset_env, "RAILS_GROUPS=assets"

role :web, "abel.doo2.net"

set :user, 'hangul_ipsum'
#ssh_options[:keys] = [File.join(ENV['HOME'], '.ssh', 'thefronkey.pem')]
default_run_options[:pty] = true

set :unicorn_conf, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :default, :roles => :web do
    update
    restart
  end

  task :setup do
    run "mkdir -p #{deploy_to} #{deploy_to}/release #{deploy_to}/shared #{deploy_to}/shared/system #{deploy_to}/shared/log #{deploy_to}/shared/pids"
  end

  task :update, :roles => :web do
    transaction do
      update_code
      symlink
      symlink_shared
    end
  end
  task :bundle, :roles => :web do
    run "cd #{current_path} && bundle install"
  end
  task :update_code, :roles => :web, :except => { :no_release => true } do
    on_rollback { run "rm -rf #{release_path}; true" }
    strategy.deploy!
    finalize_update
  end

  desc "Zero-downtime restart of Unicorn"
  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{current_path} && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end

  desc "Start unicorn"
  task :start do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -E #{rails_env} -D"
  end

  desc "Stop unicorn"
  task :stop do
    run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  task :symlink, :roles => :web, :except => { :no_release => true } do
    on_rollback do
      if previous_release
        run "rm -f #{current_path}; ln -s #{previous_release} #{current_path}; true"
      else
        logger.important "no previous release to rollback to, rollback of symlink skipped"
      end
    end

    run "rm -f #{current_path} && ln -s #{latest_release} #{current_path}"
  end
    task :setup_shared, :roles => :web do
    run "mkdir #{shared_path}/db"

    # SYMLINK stalk

    puts "Now edit the config files in #{shared_path}."
  end
  task :symlink_shared, :roles => :web do
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{latest_release}/db/production.sqlite3"
  end
  task :finalize_update, :roles => :web, :except => { :no_release => true } do
    run "chmod -R g+w #{latest_release}" if fetch(:group_writable, true)

    # mkdir -p is making sure that the directories are there for some SCM's that don't
    # save empty folders
    run <<-CMD
      rm -rf #{latest_release}/log #{latest_release}/tmp/pids &&
      mkdir -p #{latest_release}/tmp &&
      ln -s #{shared_path}/log #{latest_release}/log &&
      ln -s #{shared_path}/pids #{latest_release}/tmp/pids
    CMD

    if fetch(:normalize_asset_timestamps, true)
      stamp = Time.now.utc.strftime("%Y%m%d%H%M.%S")
      asset_paths = %w(images stylesheets javascripts).map { |p| "#{latest_release}/public/#{p}" }.join(" ")
      run "find #{asset_paths} -exec touch -t #{stamp} {} ';'; true", :env => { "TZ" => "UTC" }
    end
  end
  task :cleanup, :roles => :web, :except => { :no_release => true } do
    count = fetch(:keep_releases, 5).to_i
    if count >= releases.length
      logger.important "no old releases to clean up"
    else
      logger.info "keeping #{count} of #{releases.length} deployed releases"

      directories = (releases - releases.last(count)).map { |release|
        File.join(releases_path, release) }.join(" ")

        run "rm -rf #{directories}"
    end
  end
  namespace :assets do
    # Refer comments regarding these tasks from capistrano-2.9.0 gem
    task :symlink, :roles => :web, :except => { :no_release => true } do
      run <<-CMD
        rm -rf #{latest_release}/public/#{assets_prefix} &&
        mkdir -p #{latest_release}/public &&
        mkdir -p #{shared_path}/assets &&
        ln -s #{shared_path}/assets #{latest_release}/public/#{assets_prefix}
        CMD
    end

    task :precompile, :roles => :web, :except => { :no_release => true } do
      run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile"
    end

    task :clean, :roles => :web, :except => { :no_release => true } do
      run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:clean"
    end
  end
end

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'

after  "deploy",             "deploy:cleanup" # keeps only last 5 releases
after  "deploy:setup",       "deploy:setup_shared"
before 'deploy:finalize_update', 'deploy:assets:symlink'
after "deploy:symlink_shared", "deploy:bundle"
after 'deploy:symlink_shared', 'deploy:assets:precompile'
