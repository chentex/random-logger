#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

generate_random_string() {
   tr -dc A-Za-z0-9 </dev/urandom | head -c 8
}

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-4 -n 1)
   D=`date -Iseconds`
   RANDOM_STRING=$(generate_random_string)
   case "$I" in
      "1") echo "$D ERROR An error is usually an exception that has been caught and not handled. $RANDOM_STRING"
      ;;
      "2") echo "$D INFO This is less important than debug log and is often used to provide context in the current task. $RANDOM_STRING"
      ;;
      "3") echo "$D WARN A warning that should be ignored is usually at this level and should be actionable. $RANDOM_STRING"
      ;;
      "4") echo "$D DEBUG This is a debug log that shows a log that can be ignored. $RANDOM_STRING"
      ;;
   esac
   c=$(( c+1 ))
done
