set :stage, :staging
server 'staging.trase.earth', user: 'ubuntu', roles: %w{web app db}, primary: true
set :ssh_options, {
    forward_agent: true
}
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
