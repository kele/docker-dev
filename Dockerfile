FROM ubuntu:17.10

LABEL maintainer="damian.bogel@gmail.com"

RUN apt-get update

RUN apt-get install -y --force-yes \
    git curl make gcc g++ clang \
    vim git wget

RUN apt-get install -y --force-yes \
    python python-pip \
    python3 python3-pip

RUN apt-get install -y --force-yes \
    trash-cli silversearcher-ag

# Dotfiles
RUN git clone https://github.com/kele/dev-dotfiles.git ~/.dotfiles

# zsh
RUN apt-get install -y --force-yes \
    zsh

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && ln -s ~/.dotfiles/zshrc ~/.zshrc

# Tmux
RUN apt-get install -y --force-yes \
    tmux

RUN ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Vim setup
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && ln -s ~/.dotfiles/vimrc ~/.vimrc \
    && git clone https://github.com/flazz/vim-colorschemes.git ~/colorschemes \
	&& cp -r ~/colorschemes/colors ~/.vim/ \
    && rm -rf ~/colorschemes \
    && mkdir ~/.vim-backups \
    && vim +PluginInstall +qall

RUN apt-get clean
