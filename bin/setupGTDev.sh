#!/bin/sh

#-------------
# spinner
#-------------
spinner_pid=

spinner_start() {
	local LC_CTYPE=C
	local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
	local charwidth=3
	local i=0
	tput civis # cursor invisible

	{ while : ; do i=$(((i + $charwidth) % ${#spin})) ; printf "%s" "$1 ${spin:$i:$charwidth}" ; echo "\r\c" ; sleep 0.1 ; done  & } 2>/dev/null
	spinner_pid=$!
}

spinner_stop() {
{ 
	kill -9 $spinner_pid && wait; } 2>/dev/null
	set -m
	echo -en "\033[2K\r"
	tput cnorm # reset cursor
}
trap spinner_stop EXIT



start=$(date +%s.%N)

# todo: download for the right platform
subversion=$1
downloadFile=GlamorousToolkit-MacOS-aarch64-v1.0.${subversion}.zip
downloadLink=https://dl.feenk.com/gt/${downloadFile}

# install location
installLocation=$(PWD)/gt

# create install location
mkdir -p $installLocation

# download and unzip
curl -LO "${downloadLink:-}" \
&& unzip -qq -d "${installLocation}" "${downloadFile}" \
&& rm "${downloadFile}"

# install stuff in gt
spinner_start "Installing Projects... "
$installLocation/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli $installLocation/GlamorousToolkit.image st "loadFalconDev.st" --interactive --save --quit
spinner_stop

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "Completed in: $execution_time"