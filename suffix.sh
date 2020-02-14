#!/bin/bash
 
# Adds a suffix to each line in STDIN
# Suffix Added is the first command line argument

while read line
do
 echo "$line$1"
done
