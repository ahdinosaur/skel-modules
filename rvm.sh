#!/bin/sh

echo "installing rvm"
wget --no-check-certificate https://get.rvm.io -O - | bash -s stable --ruby

echo "deleting zprofile and zshrc made by rvm install."
rm ~/.zprofile
rm ~/.zshrc
