#!/bin/bash

# Usage <bash name> <file_name1> <file_name2>

if [ -z $1 -o -z $2 ]
then
echo "Usage: file_comparison <file_name1> <file_name2>"
exit 0
fi

file1=$(md5sum $1)
file2=$(md5sum $2)

IFS=' '
read -ra arr1 <<<$file1
read -ra arr2 <<<$file2

echo "file1 is ${arr1[0]}"
echo "file1 is ${arr2[0]}"

if [ $arr1[0] = $arr2[0] ]
then
echo "The files are identical"
else
echo "The files are different"
fi