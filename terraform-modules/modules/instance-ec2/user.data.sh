#! /bin/bash
yum update -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
sudo su
yum update -y
yum install make gcc gcc-c++ kernel-devel -y
yum groupinstall "Development Tools" -y
exit
nvm install 14.19.0
npm install --global yarn
npm i pm2 -g
git clone git@bitbucket.org:liqi-assets/liqi-exchange.git
cd liqi-exchange
yarn