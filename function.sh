#!/bin/bash

greet(){
    echo "$(($1 + $2 + $3))"
}

greet 3 4 9


sum(){

    c=$(($1 + $2))

    return $c
}


sub(){

    c=$(($1 - $2))

    return $c
}

sub 8 7
retp=$?

sum 8 7
ret=$?




echo $ret
echo $retp