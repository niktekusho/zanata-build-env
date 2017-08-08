#!/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts

# Testing if node installation is working
node -v
npm -v

# config npm
mkdir "$HOME"/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=\"\$PATH:\$HOME/.npm-global/bin\"" >> $HOME/.bashrc