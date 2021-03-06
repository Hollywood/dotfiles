#!/bin/zsh
source "$HOME/.dotfiles/inc/helpers.sh"

nvm="${HOME}/.nvm"

[ ! -d "${nvm}" ] && mkdir "${nvm}"
[ ! -f "$HOME/.npmrc" ] && touch "$HOME/.npmrc" # npm config file
export NVM_DIR="${nvm}"
source "$(brew --prefix nvm)/nvm.sh"

# node versions
section "node version"

formatexec "nvm install iojs"  # install latest io.js version
formatexec "npm install -g npm@latest"

formatexec "nvm install --lts node"  # install latest lts version
formatexec "npm install -g npm@latest"

formatexec "nvm install node"  # install latest node.js version
formatexec "npm install -g npm@latest"

formatexec "nvm alias default node"
formatexec "nvm use default"

section "installed node versions"
formatexec "nvm ls"
echo

# modules
section "node modules"

question "Do you want to reinstall prior packages?" "Yn"
read _reinstall

if [[ "$_reinstall" == "y" || "$_reinstall" == "" ]]; then
  # reinstall packages
  question "From which version?"
  read _NODE_VERSION

  formatexec "nvm reinstall-packages v${_NODE_VERSION}"
else
  # install dependencies
  MODS=(
    alfred-fkill
    alfred-npms
    ava
    azure-cli
    babel-cli
    coffee-script
    dark-mode
    doctoc
    electron
    eslint
    fast-cli
    generator-alfred
    generator-appveyor
    generator-electron
    generator-hubot
    generator-nm
    generator-uebersicht
    grunt
    hpm-cli
    jasmine
    mocha
    npm
    npms-cli
    snyk
    speed-test
    xo
    yo
  )

  for MOD in $MODS; do
    if $(npm -g ls | grep "$MOD@[0-9\.]*$" > /dev/null 2>&1); then
        formatexec "npm upgrade -g $MOD"
        print -P "  └ %F{3}upgraded%f"
    else
        formatexec "npm install -g $MOD > /dev/null 2>&1"
        print -P "  └ %F{2}installed%f"
    fi
  done
fi

echo

formatexec "npm ls --depth=0"

ok
