#! /usr/bin/env sh
PROGNAME=$0
. private/shFeedback
start_banner

# todo: download for the right platform
downloadFile=`curl -s -o /dev/stdout https://dl.feenk.com/gt/GlamorousToolkitOSXM1-release`
downloadLink=https://dl.feenk.com/gt/${downloadFile}

# install location
installLocation=$(PWD)/gt

information_banner "Creating Install Location: ${installLocation}"
# create install location
mkdir -p $installLocation

# download and unzip
information_banner "Downloading from: ${downloadLink}"
curl -LO "${downloadLink:-}" \
&& unzip -qq -d "${installLocation}" "${downloadFile}" \
&& rm "${downloadFile}"

# install stuff in gt
information_banner "Starting installation"
spinner_start "Installing Projects... "
$installLocation/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli $installLocation/GlamorousToolkit.image st "loadFalconDev.st" --interactive --save --quit
spinner_stop
