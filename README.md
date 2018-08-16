# .dotfiles & vim plugins
Bash, Vim, Tmux, IRB, ...

# Setup of new machine:

```
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.irbrc ~/.irbrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vim ~/.vim
```

# Install tmux 2.2 on Centos 7.1
https://gist.github.com/relaxdiego/273d511cb156d2c7d0171a0ccaa5ab2b

# Git color
git config --global color.ui true

# ######### Only do once and commit to repo ###########

# Vim / pathogen setup

mkdir -p ~/.dotfiles/.vim
cd ~/.dotfiles/.vim
mkdir -p autoload bundle

curl -LSso ~/.dotfiles/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# CtrlP
git clone https://github.com/kien/ctrlp.vim.git ~/.dotfiles/.vim/bundle/ctrlp.vim
rm ~/.dotfiles/.vim/bundle/ctrlp.vim/.gitignore
rm -rf ~/.dotfiles/.vim/bundle/ctrlp.vim/.git

# vim-surround
git clone git://github.com/tpope/vim-surround.git ~/.dotfiles/.vim/bundle/vim-surround
rm ~/.dotfiles/.vim/bundle/vim-surround/.gitignore
rm -rf ~/.dotfiles/.vim/bundle/vim-surround/.git
