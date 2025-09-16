#!/bin/bash

a="de"
b="de"

if test $a == $b
then
echo "Equal"

else
echo "Not equal"

fi

a="de"
b=""

if test -z "$a"
then
echo "empty"

else
echo "Not empty"

fi

if test -s test.txt
then 
echo "its not empty"

else
echo "Its a empty"

fi

if test -d dir
then 
echo "its a dir"

else
echo "Its not dir"

fi