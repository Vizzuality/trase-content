set :stage, :staging
set :branch, :develop

server 'staging.trase.earth', user: 'ubuntu', roles: %w{web app db}, primary: true
set :ssh_options, {
    forward_agent: true
}
