#!/bin/sh
set -e

echo; echo 'start searching Makefile..'

while true; do
	echo "$PWD"
	if [ -e "$PWD/Makefile" ]; then
		echo "EXEC: make run"
		make "$@"
		exit
	else
		echo '...X'
		if [ "/" == "$PWD" ]; then
			echo 'E: reached root dir' >&2
			exit -1
		fi
		cd ..
	fi
done
