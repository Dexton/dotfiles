# Fish tutorial
set -g -x PATH /usr/local/bin $PATH

# export CENTER_HOST='http://localhost:3001' # 'http://center.dev'
export CENTER_HOST='http://ops-stg.365.is' # 'http://center.dev'
export KEYSTORE_HOST='http://localhost:3002' # 'http://center.dev'
export GOPATH='/home/arnthor/code/'

# Add spotify-notify path
set -g -x PATH /opt/spotify-notify/ $PATH

# Add .local/bin for my own scripts
set -g -x PATH /home/arnthor/.local/bin $PATH

#rbenv
set -u fish_user_paths $fish_user_paths ~/.rbenv/bin
. (rbenv init -|psub)

### Added by the Heroku Toolbelt
set -g -x PATH /usr/local/heroku/bin $PATH

# Python config paths
set -x CHARGER_CONFIG ~/projects/charger/.mr.developer.cfg
set -x USAGE_SERVICES_CONFIG ~/projects/usage-services/.mr.developer.cfg
set -x MEDIATOR_CONFIG ~/projects/mediator/.mr.developer.cfg

set fish_greeting Taco Burrito Dale!
# Startup with virtualenv
eval (python -m virtualfish)

# cd hacks
alias .. "cd .."
alias ... "cd ../.."
