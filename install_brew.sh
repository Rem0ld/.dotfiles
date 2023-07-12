#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &
PID=$!
wait $PID

result=$?
if [[ $result != 0 ]]; then
	echo "Something wrong happened when installing brew"
	exit 1;
fi
