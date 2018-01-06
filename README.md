dotfiles
========

Setup

    # Install homeshick
    git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    source $HOME/.homesick/repos/homeshick/homeshick.sh

    # Install custom repos
    homeshick clone --batch cardoe/dotfiles

    # Install public repos
    homeshick clone --batch robbyrussell/oh-my-zsh
    homeshick clone --batch zsh-users/zsh-syntax-highlighting

    # Link it all to $HOME
    homeshick link --force
