#!/bin/sh

NAME=pentadactyl
DL_NUM=235854
SRC=addon-$DL_NUM-latest.xpi

mkdir -p ~/.mozilla/extensions
echo "changing into ~/.mozilla/extensions/ directory"
cd ~/.mozilla/extensions
echo "downloading $NAME source"
wget https://addons.mozilla.org/firefox/downloads/latest/$DL_NUM/$SRC
echo "making a new directory $NAME"
mkdir $NAME
echo "unzipping source into new directory"
unzip $SRC -d $NAME
echo "deleting source"
rm $SRC

# hard-coded
firefox_id={ec8030f7-c20a-464f-9b0e-13a3a9e97384}
echo "firefox id = $firefox_id"
mkdir $firefox_id
app_id=$(cat $NAME/install.rdf | egrep "em:id=\".+@.+\..+\"" | cut -d \" -f 2)
echo "app id = $app_id"
echo "moving directory into $firefox_id/$app_id"
mv $NAME "$firefox_id/$app_id"
