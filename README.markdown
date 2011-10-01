Dotfiles
========

Installation process based on [Ryan Bates Dot Files](http://github.com/ryanb/dotfiles/).

Installation
------------

With Git:

    git clone git://github.com/karmi/dotfiles ~/dotfiles
    cd ~/dotfiles
    rake install

Without Git:

    cd $HOME
    mkdir -p dotfiles
    curl -L -k https://github.com/karmi/dotfiles/tarball/master | tar xz --strip 1 -C dotfiles
    cd dotfiles
    rake install
