#!/bin/bash

print_regex='[[:space:]]+print\('
did_find=0
for fname in "$@"
do
    ffound=`grep -e ${print_regex} ${fname} | grep -e '\w' | wc -l`
    if [ $ffound -gt 0 ]
    then
        echo "Found $ffound print statements in $fname"
        did_find=1
    fi
done

if [ $did_find -eq 0 ]
then
    echo "No print statements found"
else
    exit 1
fi
