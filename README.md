dotfiles
========

Setup

    # Install homeshick
    git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    source $HOME/.homesick/repos/homeshick/homeshick.sh

    # Install custom repos
    homeshick clone --batch https://cardoe@bitbucket.org/cardoe/dotfiles.git

    # Install public repos
    homeshick clone --batch robbyrussell/oh-my-zsh

    # Link it all to $HOME
    homeshick link --force
