server 'traseplatform.org', user: 'ubuntu', roles: %w{web app db}, primary: true
set :ssh_options, {
    forward_agent: true
}
