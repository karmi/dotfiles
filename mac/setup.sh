#!/bin/sh

echo "___________________________________________________________"
echo "★ Customizing, Configuring & Setting Up a Mac OS X System ★"
echo "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"
echo

echo "  → Clean up Apple Ruby..."
sudo rm -r /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8
sudo gem update --system
sudo gem clean

echo "  → Installing Homebrew..."
sudo mkdir -p /usr/local
sudo mkdir -p /usr/local/bin
sudo chown -R $USER /usr/local
cd $HOME && mkdir -p homebrew
curl -# -L -K https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew
ln -nfs $HOME/homebrew/bin/brew /usr/local/bin/
brew update

echo "✓ Homebrew installed"

echo "  → Installing Git..."
brew install git

echo "✓ Git installed"

echo "  → Hooking up Homebrew to your fork..."
rm -rf /tmp/myhomebrew
git clone git@github.com:$USER/homebrew.git /tmp/myhomebrew
git --git-dir=/tmp/myhomebrew/.git remote rename origin $USER
git --git-dir=/tmp/myhomebrew/.git remote add upstream git://github.com/mxcl/homebrew.git
cp -r /tmp/myhomebrew/.git $HOME/homebrew/.git
rm -rf /tmp/myhomebrew

echo "✓ Homebrew origin pointed to http://github.com:$USER/homebrew"

echo "  → Installing dotfiles..."
git clone git://github.com/$USER/dotfiles $HOME/dotfiles
cd $HOME/dotfiles
rake install

echo "✓ Dotfiles installed"

echo "  → Installing essential RBEnv and Ruby-Build..."
brew install rbenv
brew install ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .bash_profile
echo 'eval "$(rbenv init -)"' >> .bash_profile

echo "✓ RBEnv installed"

echo "  → Installing Ruby"
rbenv install 1.9.3-rc1
rbenv global  1.9.3-rc1

echo "✓ Installed Ruby: $(rbenv global)"

echo "  → Installing essential Rubygems..."
gem install rake bundler factory_girl fakeweb iconv nokogiri paperclip rails rack-cache rack-contrib rack-test rcov rdiscount rdoc redis redis-namespace resque shoulda sinatra sqlite3-ruby thin turn will_paginate wirble yajl-ruby yard amqp clearance rest-client curb
rbenv rehash

echo "✓ Rubygems installed"

echo "  → Installing utilities..."
brew install macvim
brew install unrar
brew install wget

echo "✓ Utilities installed"
