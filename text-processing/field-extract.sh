#!/usr/bin/env bash
# Requirements: Logs should be indentical format
# Uncomment for grep functionality (WIP).


read -p 'Enter filepath: ' file
###read -p 'grep content: ' greppy

###OFS=replace delimeter with single space. RS=defines a line separated by spaces or tabs.
head -n 1 $file | awk '{OFS = " "; print $0}' | awk '{print $0}' RS=' |	' | nl ###| grep $greppy

echo ""

arrColumns=
echo 'Enter Field Numbers ([Ctrl-D] to exit): '
while read col 
do
       arrColumns+=($col)
done

echo ""

arrayLength=${#arrColumns[@]}

for ((i=1; i<${arrayLength}; i++));
do
	cat $file | awk -v var=${arrColumns[$i]} '{print $var}' | sort -u
done

echo ""

