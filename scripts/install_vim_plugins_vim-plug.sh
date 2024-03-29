#!/bin/bash
set -euxo pipefail

#Managing dependencis via vim-plug
#https://github.com/junegunn/vim-plug

PINNED_VIM_PLUG=https://raw.githubusercontent.com/junegunn/vim-plug/e300178a0e2fb04b56de8957281837f13ecf0b27/plug.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	$PINNED_VIM_PLUG

mkdir -p ~/.vim/plugged
pushd ~/.vim/plugged

echo Installing YCM
git clone https://github.com/Valloric/YouCompleteMe.git
pushd YouCompleteMe
git checkout 3ededaed2f9923d50bf3860ba8dace0f7d2724cd
git submodule update --init --recursive
sudo apt install build-essential cmake python3-dev -y
python3 install.py --clangd-completer
popd

echo Installing syntastic
git clone https://github.com/vim-syntastic/syntastic.git
pushd syntastic
git checkout b7f4f71539038d33f173bfa72631737da049575a
popd

echo Installing vim-easy-align
git clone https://github.com/junegunn/vim-easy-align.git
pushd vim-easy-align
git checkout 12dd6316974f71ce333e360c0260b4e1f81169c3
popd

echo Installing yats.vim
git clone https://github.com/HerringtonDarkholme/yats.vim
pushd yats.vim
git checkout 3e6a46271fe307741dbd06507e36ec08f118263a
popd

echo Installing vim-jsx-pretty
git clone https://github.com/MaxMEllon/vim-jsx-pretty
pushd vim-jsx-pretty
git checkout 6989f1663cc03d7da72b5ef1c03f87e6ddb70b41
popd

echo Installing vim-js
git clone https://github.com/yuezk/vim-js
pushd vim-js
git checkout 90f340d31907590fad059cd9aab03a55ab49e352
popd

echo "vim-plug was installed. To add new plugins, add plugins to ~/.vimrc, then open vim and run :PlugInstall - check status with :PlugStatus"
