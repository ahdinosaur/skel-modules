#!/bin/sh

SRC=pentadactyl-1.0.xpi

mkdir -p ~/.mozilla/extensions
cd ~/.mozilla/extensions
wget http://dactyl.googlecode.com/files/$SRC
mkdir pentadactyl
unzip $SRC -d pentadactyl
rm $SRC

firefox_id=$(cat pentadactyl/install.rdf | egrep "em:id=\"{[0-9a-f-]+}\"" | cut -d \" -f 2)
mkdir $firefox_id
app_id=$(cat pentadactyl/install.rdf | egrep "em:id=\".+@.+\..+\"" | cut -d \" -f 2)
mv pentadactyl "$firefox_id/$app_id"
