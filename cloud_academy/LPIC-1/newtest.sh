#!/bin/bash

text1=hello
text2=goodbye

if test $text1 != $text2; then
	echo "not identical"
else
	echo "identical"
fi

exit 0