#!/bin/bash

echo "What directory add to path?"
read new_path

if [ -e "$new_path" ]; then
	echo "The [" $new_path "] directory exists."
	echo $new_path " is now in the path."

	PATH=$PATH:$new_path
	export PATH
	echo "your path is now: " 
	echo $PATH
else
	echo "Whoops, " $new_path " doesn't exist"
fi
exit 0