
server '3.89.110.45', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'