#!bin/bash

[[ $EUID -eq 0 ]] && echo 'This script must be run as NON root' && exit 1

#export http_proxy=
#export https_proxy=
#export no_proxy=

echo -e "\n\nrunning apt update and installs\n\n"
sudo -E apt-get update --fix-missing
sudo -E apt-get install -y ruby-full build-essential zlib1g-dev vim git curl tree

echo -e "\n\nInstall Ruby Gems to ~/gems\n\n"
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$PATH:'$(ruby -e 'puts Gem.user_dir')/bin\" >> ~/.bashrc
source ~/.bashrc

# Look for latest supported version for github pages
# https://pages.github.com/versions/
echo -e "\n\ninstalling jekyl\n\n"
echo "gem 'jekyll', '~> 3.9', '== 3.9.3'" > Gemfile
/usr/bin/gem install jekyll bundler --user-install

# install nodejs
sudo -E apt-get install -y nodejs npm

# build repo locally
# git clone https://github.com/dlux/dlux.github.io.git
# pushd dlux.github.io
# git submodule update --init --recursive
# bundle
# jekyll serve --host 0.0.0.0
#


