#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-5 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 0-4 -n 1)
   d=`date --iso-8601=seconds`
   case "$instruction" in
      "1") echo "$d ERROR something happened in this execution."
      ;;
      "2") echo "$d INFO takes the value and converts it to string."
      ;;
      "3") echo "$d WARN variable not in use."
      ;;
      "4") echo "$d DEBUG first loop completed."
      ;;
   esac
done
