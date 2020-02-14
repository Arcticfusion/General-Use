#!/bin/bash

# Adds a prefix to each line in STDIN
# Prefix added is the first command line argument

while read line
do
 echo "$1$line"
done
