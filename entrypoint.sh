#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-3 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 1-4 -n 1)
   d=`date`
   case "$instruction" in
      "1") echo "ERROR ($d) something happened in this execution."
      ;;
      "2") echo "INFO ($d) takes the value and converts it to string."
      ;;
      "3") echo "WARN ($d) variable not in use."
      ;;
      "4") echo "DEBUG ($d) first loop completed."
      ;;
   esac
done
