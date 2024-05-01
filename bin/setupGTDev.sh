#!/bin/sh

# todo: download for the right platform
downloadLink=https://dl.feenk.com/gt/GlamorousToolkit-MacOS-aarch64-v1.0.720.zip

# install location
installLocation=$(PWD)/gt

# create install location
mkdir -p $installLocation

# download and unzip
temporary_dir=$(mktemp -d) \
&& curl -LO "${downloadLink:-}" \
&& unzip -qq -d "$temporary_dir" *.zip \
&& rm *.zip \
&& mv "$temporary_dir"/* ${1:-"$installLocation"} \
&& rm -rf $temporary_dir

# install stuff in gt
$installLocation/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli $installLocation/GlamorousToolkit.image -- --save loadFalconDev.st