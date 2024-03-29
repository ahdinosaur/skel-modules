#!/bin/sh

echo "download tony's tmux config."
git clone https://github.com/tony/tmux-config.git ~/.tmux-tony

echo "go into tmux-tony repo"
cd ~/.tmux-tony

echo "prep ourself to download submodule"
git submodule init

echo "download submodule"
git submodule update

echo "change dir to tmux-mem-cpu-load"
cd ~/.tmux-tony/vendor/tmux-mem-cpu-load

echo "general make file"
cmake .

echo "compile our binary"
make

echo "install our binary to /usr/local/bin/tmux-mem-cpu-load"
cp tmux-mem-cpu-load ~/bin/

echo "go home"
cd ~

echo "update config"
tmux source-file ~/.tmux.conf

