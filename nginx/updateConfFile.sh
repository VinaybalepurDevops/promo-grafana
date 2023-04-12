#!/bin/sh

a=$(docker container ls | grep "ui:1" | awk '{print $1}'| head -1)
b=$(docker container ls | grep "ui:1" | awk '{print $1}'| tail -1)
c=$(docker inspect $a | grep HostPort | tr -d '"' | tr -d ' ' | tail -1 | cut -d ":" -f2  )
d=$(docker inspect $b | grep HostPort | tr -d '"' | tr -d ' ' | tail -1 | cut -d ":" -f2  )
echo $c
echo $d

printf "upstream vote { \n server $1:80 weight=5 max_fails=2 fail_timeout=3; \n server $1:80 weight=5 max_fails=2 fail_timeout=3; \n }" > conf.d/default.conf


