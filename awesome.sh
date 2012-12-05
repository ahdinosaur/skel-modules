#!/bin/sh

mkdir ~/config
git clone https://github.com/ahdinosaur/awesome-config.git ~/.config/awesome
cd ~/.config/awesome
git submodule init
git submodule update
