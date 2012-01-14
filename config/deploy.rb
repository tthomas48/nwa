set :application, "nwa"
set :repository,  "https://github.com/tthomas48/nwa"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www/rails/nwa"
server "loadedguntheory.com", :app, :web, :db, :primary => true

set :use_sudo, false

#role :web, "loadedguntheory.com"                          # Your HTTP server, Apache/etc
#role :app, "loadedguntheory.com"                          # This may be the same as your `Web` server
#role :db,  "loadedgunteory.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    ;
  end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end