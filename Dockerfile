FROM ubuntu:19.04

LABEL maintainer="damian.bogel@gmail.com"

RUN apt-get update

RUN apt-get install -y  \
    git curl make gcc g++ clang \
    vim git wget

RUN apt-get install -y  \
    python python-pip \
    python3 python3-pip

RUN apt-get install -y  \
    trash-cli silversearcher-ag

# Dotfiles
RUN git clone https://github.com/kele/dev-dotfiles.git ~/.dotfiles

# zsh
RUN apt-get install -y  \
    zsh

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && ln -s ~/.dotfiles/zshrc ~/.zshrc

# Tmux
RUN apt-get install -y  \
    tmux

RUN ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN $HOME/.cargo/bin/rustup component add rustfmt
## Autocompletion
RUN $HOME/.cargo/bin/rustup component add rust-src
RUN $HOME/.cargo/bin/cargo install --vers 2.0.14 racer

# Golang
RUN apt-get install -y golang-go

# Vim setup
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && ln -s ~/.dotfiles/vimrc ~/.vimrc \
    && git clone https://github.com/flazz/vim-colorschemes.git ~/colorschemes \
	&& cp -r ~/colorschemes/colors ~/.vim/ \
    && rm -rf ~/colorschemes \
    && mkdir ~/.vim-backups \
    && vim +PluginInstall +qall

RUN apt-get clean
