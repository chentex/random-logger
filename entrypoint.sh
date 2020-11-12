#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-5 -n 1)
   # Build default Spring Boot logline according to https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-features.html#boot-features-logging-format
   D=`date +"%Y-%m-%d %H:%M:%S.000"`
   case "$I" in
      "1") echo "$D ERROR 12345 --- [main] org.random.logger : An error is usually an exception that has been caught and not handled."
      ;;
      "2") echo "$D  INFO 12345 --- [main] org.random.logger : This is less important than debug log and is often used to provide context in the current task."
      ;;
      "3") echo "$D  WARN 12345 --- [main] org.random.logger : A warning that should be ignored is usually at this level and should be actionable."
      ;;
      "4") echo "$D DEBUG 12345 --- [main] org.random.logger : This is a debug log that shows a log that can be ignored."
      ;;
      "5") echo "$D ERROR 12345 --- [main] org.random.logger : Exception in thread \"main\" java.lang.RuntimeException: Something has gone wrong, aborting!
    at com.myproject.module.MyProject.badMethod(MyProject.java:22)
    at com.myproject.module.MyProject.oneMoreMethod(MyProject.java:18)
    at com.myproject.module.MyProject.anotherMethod(MyProject.java:14)
    at com.myproject.module.MyProject.someMethod(MyProject.java:10)
    at com.myproject.module.MyProject.main(MyProject.java:6)"
      ;;
   esac
   c=$(( c+1 ))
done
