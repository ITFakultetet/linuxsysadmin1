#! /usr/bin/bash

echo "Hvilken mappe vil du sjekke?"

read mappe
   find $mappe -type f | while read fil; do
    if [[ "$fil" = *[[:space:]]* ]]; then
    mv "$fil" `echo $fil | tr ' ' '_'`
    fi;
   done


