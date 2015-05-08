#!/bin/bash

apt-get -y update

echo "[Sphinx 3DR Theme]: Installing build essentials"
apt-get -y install build-essential wget vim git libffi-dev
echo "[Sphinx 3DR Theme]: Installing Python Devel"
apt-get -y install python-dev
echo "[Sphinx 3DR Theme]: Installing pip ..."
apt-get -y install python-pip
easy_install -U pip
echo "[Sphinx 3DR Theme]: Installing NodeJS ... "
apt-get -y install nodejs
apt-get -y install npm
echo "[Sphinx 3DR Theme]: Patch nodejs - >node for Ubuntu ... "
ln -s /usr/bin/nodejs /usr/bin/node

echo "[Sphinx 3DR Theme]: Installing rbenv ... "
mkdir /home/vagrant/.rbenv
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv > /dev/null 2>&1
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
chown -R vagrant:vagrant .rbenv/
source ~/.bashrc

# load rbenv defaults for user root
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo "[Sphinx 3DR Theme]: Installing ruby-build ... "
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build > /dev/null 2>&1
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
chown -R vagrant:vagrant .rbenv/
source ~/.bashrc

# load rbenv path for ruby-build under user root
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

echo "[Sphinx 3DR Theme]: Installing rbenv-gem-rehash ... "
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash > /dev/null 2>&1
chown -R vagrant:vagrant .rbenv/
source ~/.bashrc

echo "[Sphinx 3DR Theme]: Installing ruby 2.2.2 ... "
rbenv install 2.2.2
rbenv global 2.2.2
ruby -v

echo "[Sphinx 3DR Theme]: Updating rubygems ... "
apt-get install -y ruby-dev
gem install rubygems-update
update_rubygems
gem update --system

echo "[Sphinx 3DR Theme]: Installing Bundler ... "
gem install bundler
echo "[Sphinx 3DR Theme]: Installing Bower ... "
npm install -g bower > /dev/null 2>&1
echo "[Sphinx 3DR Theme]: Installing Grunt-cli ... "
npm install -g grunt-cli > /dev/null 2>&1

echo "[Sphinx 3DR Theme]: Install dependencies ... "
cd /vagrant

echo "[Sphinx 3DR Theme]: Installing Sphinx ... "
pip install -r requirements.txt

echo "[Sphinx 3DR Theme]: Installing Gems  ... "
bundle install
echo "[Sphinx 3DR Theme]: Installing NPM requirements  ... "
npm install
echo "[Sphinx 3DR Theme]: Installing Bower requirements  ... "
bower install

echo "[Sphinx 3DR Theme]: Building"
grunt build
