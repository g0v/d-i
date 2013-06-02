#!/bin/bash
#sudo add-apt-repository -y ppa:chris-lea/node.js 
sudo apt-get -y upgrade
#sudo apt-get install nodejs

# chef
cd /tmp/
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/chef_10.26.0-1.ubuntu.11.04_amd64.deb
sudo dpkg -i *.deb
cd - 

# ruby 
curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
source ~/.bashrc
rvm 1.9.3 do gem install sass compass --no-ri --no-rdoc
