#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-3 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 1-4 -n 1)
   case "$instruction" in
      "1") echo "ERROR something happened in this execution."
      ;;
      "2") echo "INFO takes the value and converts it to string."
      ;;
      "3") echo "WARN variable not in use."
      ;;
      "4") echo "DEBUG first loop completed."
      ;;
   esac
done
