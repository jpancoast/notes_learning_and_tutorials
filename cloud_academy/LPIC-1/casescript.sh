#!/bin/bash

echo "favorite color: "

read COLOR

case $COLOR in
red | blue ) echo "I love " $COLOR
;;
orange | brown ) echo "NOt bad " $COLOR " is OK"
;;
black | purple ) echo "yuk " $COLOR " is ugly"
;;
* ) echo "Sorry"
;;
esac

exit 0