#!/bin/bash
set -euxo pipefail

mkdir -p ~/.vim
cd ~/.vim
mkdir -p bundle
cd bundle

#Vundle
git clone https://github.com/gmarik/Vundle.vim.git
pushd Vundle.vim
git checkout b255382d6242d7ea3877bf059d2934125e0c4d95
popd

git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git checkout 8bc02ee4877bfe07ed92cc4d471c353f1ab84ef6
git submodule update --init --recursive
sudo apt install build-essential cmake python3-dev -y
python3 install.py --clangd-completer
cd ..

git clone https://github.com/vim-syntastic/syntastic.git
cd syntastic
git checkout b3e2d8470fddc7f2b598f09023ebc5045a3fb1fd
cd ..

git clone https://github.com/nvie/vim-flake8.git
cd vim-flake8
git checkout 0c7cf6dc038223b44e3c0a702fe2acf997768e8a
cd ..

echo "Vundle was installed. To add new plugins, add plugins to ~/.vimrc, then open vim and run :PluginInstall"
