#!/bin/bash
[ -f /var/log/done ] && exit 0

add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install nodejs

curl -L https://www.opscode.com/chef/install.sh | sudo bash
sed -i s/Resource\.const_defined\?\(class_name,.*\)/Resource\.const_defined\?\(class_name\)/ /opt/chef/embedded/lib/ruby/gems/1.9.1/gems/chef-11.4.4/lib/chef/resource/lwrp_base.rb

sudo apt-get install -y ruby1.9.3

update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.3 500\
                      --slave   /usr/bin/ri   ri   /usr/bin/ri1.9.3\
                      --slave   /usr/bin/irb  irb  /usr/bin/irb1.9.3\
                      --slave   /usr/bin/erb  erb  /usr/bin/erb1.9.3\
                      --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.3
sudo update-alternatives --remove-all gem
gem1.9.3 install compass sass

touch /var/log/done
