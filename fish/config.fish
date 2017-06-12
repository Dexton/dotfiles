# Fish tutorial
set -g -x PATH /usr/local/bin $PATH

# Python config paths
set -x CENTER_HOST 'http://ops-stg.365.is' # 'http://center.dev'
set -x KEYSTORE_HOST 'http://localhost:3002' # 'http://center.dev'
set -x GOPATH '/home/arnthor/code/'
set -x CHARGER_CONFIG ~/projects/charger/.mr.developer.cfg
set -x USAGE_SERVICES_CONFIG ~/projects/usage-services/.mr.developer.cfg
set -x MEDIATOR_CONFIG ~/projects/mediator/.mr.developer.cfg

# Add .local/bin for my own scripts
set -g -x PATH /home/arnthor/.local/bin $PATH

#rbenv
set -u fish_user_paths $fish_user_paths ~/.rbenv/bin
. (rbenv init -|psub)


set fish_greeting Taco Burrito Dale!
# Startup with virtualenv
eval (python -m virtualfish)

# cd hacks
alias .. "cd .."
alias ... "cd ../.."
