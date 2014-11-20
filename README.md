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

    # Install vim plugins
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone git://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible


    # Link it all to $HOME
    homeshick link --force
