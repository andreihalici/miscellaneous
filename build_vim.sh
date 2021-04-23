#!/usr/bin/env bash
# This script will custom compile vim on a new Mac system

VIM_SOURCE_CODE_LOCATION="$PWD/vim_source_code"

# Get the vim source code
[ -d "$VIM_SOURCE_CODE_LOCATION" ] && cd "$VIM_SOURCE_CODE_LOCATION" ; git pull || git clone https://github.com/vim/vim.git $VIM_SOURCE_CODE_LOCATION

# Build vim
cd "$VIM_SOURCE_CODE_LOCATION/src"
make distclean
./configure \
	--enable-luainterp=no \
	--enable-mzschemeinterp=no \
	--enable-perlinterp=yes \
	--enable-pythoninterp=yes \
	--enable-python3interp=yes \
	--enable-tclinterp=no \
	--enable-rubyinterp=yes \
	--disable-netbeans \
	--enable-terminal \
	--disable-rightleft \
	--disable-arabic \
	--disable-farsi \
	--enable-cscope

make
sudo make install

# Clean the source files
rm -rf "$VIM_SOURCE_CODE_LOCATION"
